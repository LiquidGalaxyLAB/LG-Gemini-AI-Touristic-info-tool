import 'dart:developer';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ssh2/ssh2.dart';

import '../core/constants/constants.dart';
import '../core/utils/kml_utils.dart';
import 'file_service.dart';

class LGService {
  static final LGService _instance = LGService._internal();

  late SSHClient _client;
  late String _username;
  late String _password;
  late int _slaves;
  late Function(String) _onError;

  int get _leftScreen {
    if (_slaves == 1) {
      return 1;
    }
    return (_slaves / 2).floor() + 2;
  }

  int get _rightScreen {
    if (_slaves == 1) {
      return 1;
    }
    return (_slaves / 2).floor() + 1;
  }

  factory LGService() {
    return _instance;
  }

  LGService._internal();

  void init({
    required String host,
    required int port,
    required String username,
    required String password,
    required int slaves,
    required Function(String) onError,
  }) {
    _username = username;
    _password = password;
    _slaves = slaves;
    _onError = onError;
    _client = SSHClient(
      host: host,
      port: port,
      username: username,
      passwordOrKey: password,
    );
  }

  Future<bool> isConnected() async {
    try {
      bool isConnected = await _client.isConnected();
      if (!isConnected && shouldTryReconnecting) {
        isConnected = await connect();
      }
      return isConnected;
    } catch (e) {
      return false;
    }
  }

  Future<bool> connect() async {
    try {
      String? response = await _client.connect();
      return response == "session_connected";
    } catch (e) {
      log('$e');
      return false;
    }
  }

  disconnect() async {
    try {
      await _client.disconnect();
      shouldTryReconnecting = false;
    } catch (e) {
      _onError('Error disconnecting');
    }
  }

  Future<void> _execute(String query) async {
    try {
      String? response = "session_connected";
      if (firstTimeConnected && !await isConnected()) {
        response = await _client.connect();
        if (response != null && response.isNotEmpty) {
          log(response);
        }
      }
      if (response == "session_connected") {
        String? result = await _client.execute(query);
        if (result != null && result.isNotEmpty) {
          log(result);
        }
      }
    } catch (e) {
      log('Error executing command: $e');
    }
  }

  Future<void> flyTo(CameraPosition cameraPosition) async {
    await _execute("echo 'flytoview=${KmlUtils.lookAt(cameraPosition)}' > /tmp/query.txt");
  }

  Future<void> startOrbit() async {
    await _execute('echo "playtour=Orbit" > /tmp/query.txt');
  }

  Future<void> stopOrbit() async {
    await _execute('echo "exittour=true" > /tmp/query.txt');
  }

  Future<void> sendTour(String tourName, String tourKml) async {
    final fileName = '$tourName.kml';
    final kmlFile = await FileService().createFile(fileName, tourKml);
    await _upload(kmlFile.path);
    await _execute('echo "\nhttp://lg1:81/$fileName" >> /var/www/html/kmls.txt');
  }

  Future<void> startTour() async {
    await _execute('echo "playtour=Tour" > /tmp/query.txt');
  }

  Future<void> stopTour() async {
    await _execute('echo "exittour=true" > /tmp/query.txt');
  }

  Future<void> showLogo() async {
    await _execute(
        "chmod 777 /var/www/html/kml/slave_$_leftScreen.kml; echo '${KmlUtils.createLogos()}' > /var/www/html/kml/slave_$_leftScreen.kml");
  }

  Future<void> hideLogo() async {
    await _execute(
        "chmod 777 /var/www/html/kml/slave_$_leftScreen.kml; echo '${KmlUtils.emptyKml()}' > /var/www/html/kml/slave_$_leftScreen.kml");
  }

  Future<void> showBalloon(String kml) async {
    await cleanBalloon();
    await _execute(
        "chmod 777 /var/www/html/kml/slave_$_rightScreen.kml; echo '' > /var/www/html/kml/slave_$_rightScreen.kml");
    await _execute(
        "chmod 777 /var/www/html/kml/slave_$_rightScreen.kml; echo '$kml' > /var/www/html/kml/slave_$_rightScreen.kml");
  }

  Future<void> cleanBalloon() async {
    await _execute(
        "chmod 777 /var/www/html/kml/slave_$_rightScreen.kml; echo '${KmlUtils.emptyBalloon()}' > /var/www/html/kml/slave_$_rightScreen.kml");
  }

  Future<void> _upload(String path, {int counter = 0}) async {
    if (counter < 3) {
      try {
        String? result = await _client.connectSFTP();
        if (result == 'sftp_connected') {
          await _client.sftpUpload(
            path: path,
            toPath: '/var/www/html',
            callback: (progress) {
              log('Sent $progress');
            },
          );
        }
        _client.disconnectSFTP();
      } on Exception catch (e) {
        await _upload(path, counter: counter++);
        log("$e");
      }
    }
  }

  Future<void> sendKml(
    String kml, {
    String file = "touristicIA",
  }) async {
    if (!await isConnected()) {
      return;
    }
    try {
      await showLogo();
      final kmlFile = await FileService().createFile(file, kml);
      await _upload(kmlFile.path);
      await _execute('echo "http://lg1:81/$file" > /var/www/html/kmls.txt');
    } on Exception catch (e) {
      log("$e");
    }
  }

  Future<void> cleanKml() async {
    await stopOrbit();
    await stopTour();
    String query = 'echo "exittour=true" > /tmp/query.txt && > /var/www/html/kmls.txt';
    for (var i = 2; i <= _slaves; i++) {
      query += " && echo '${KmlUtils.emptyKml()}' > /var/www/html/kml/slave_$i.kml";
    }
    await _execute(query);
  }

  Future<void> setRefresh() async {
    const search = '<href>##LG_PHPIFACE##kml\\/slave_{{slave}}.kml<\\/href>';
    const replace =
        '<href>##LG_PHPIFACE##kml\\/slave_{{slave}}.kml<\\/href><refreshMode>onInterval<\\/refreshMode><refreshInterval>2<\\/refreshInterval>';
    final command = 'echo $_password | sudo -S sed -i "s/$search/$replace/" ~/earth/kml/slave/myplaces.kml';

    final clear = 'echo $_password | sudo -S sed -i "s/$replace/$search/" ~/earth/kml/slave/myplaces.kml';

    for (var i = 2; i <= _slaves; i++) {
      final clearCmd = clear.replaceAll('{{slave}}', i.toString());
      final cmd = command.replaceAll('{{slave}}', i.toString());
      String query = 'sshpass -p $_password ssh -t lg$i \'{{cmd}}\'';

      try {
        await _execute(query.replaceAll('{{cmd}}', clearCmd));
        await _execute(query.replaceAll('{{cmd}}', cmd));
      } catch (e) {
        log("$e");
      }
    }
    await rebootLG();
  }

  Future<void> resetRefresh() async {
    const search =
        '<href>##LG_PHPIFACE##kml\\/slave_{{slave}}.kml<\\/href><refreshMode>onInterval<\\/refreshMode><refreshInterval>2<\\/refreshInterval>';
    const replace = '<href>##LG_PHPIFACE##kml\\/slave_{{slave}}.kml<\\/href>';

    final clear = 'echo $_password | sudo -S sed -i "s/$search/$replace/" ~/earth/kml/slave/myplaces.kml';

    for (var i = 2; i <= _slaves; i++) {
      final cmd = clear.replaceAll('{{slave}}', i.toString());
      String query = 'sshpass -p $_password ssh -t lg$i \'$cmd\'';

      try {
        await _client.execute(query);
      } catch (e) {
        log("$e");
      }
    }
    await rebootLG();
  }

  Future<void> relaunchLG() async {
    for (var i = _slaves; i >= 1; i--) {
      String cmd = """RELAUNCH_CMD="\\
        if [ -f /etc/init/lxdm.conf ]; then
          export SERVICE=lxdm
        elif [ -f /etc/init/lightdm.conf ]; then
          export SERVICE=lightdm
        else
          exit 1
        fi
        if  [[ \\\$(service \\\$SERVICE status) =~ 'stop' ]]; then
          echo $_password | sudo -S service \\\${SERVICE} start
        else
          echo $_password | sudo -S service \\\${SERVICE} restart
        fi
        " && sshpass -p $_password ssh -x -t lg@lg$i "\$RELAUNCH_CMD\"""";
      await _execute('"/home/$_username/bin/lg-relaunch" > /home/$_username/log.txt');
      await _execute(cmd);
    }
  }

  Future<void> rebootLG() async {
    for (var i = _slaves; i >= 1; i--) {
      await _execute('sshpass -p $_password ssh -t lg$i "echo $_password | sudo -S reboot"');
    }
  }

  Future<void> shutdownLG() async {
    for (var i = _slaves; i >= 1; i--) {
      await _execute('sshpass -p $_password ssh -t lg$i "echo $_password | sudo -S poweroff"');
    }
  }
}
