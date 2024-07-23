import 'dart:developer';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ssh2/ssh2.dart';

import '../core/utils/balloon_utils.dart';
import '../core/utils/kml_utils.dart';

class LGService {
  static final LGService _instance = LGService._internal();

  late SSHClient _client;
  late String _username;
  late String _password;
  late int _slaves;
  late Function(String) _onError;

  int get _leftScreen {
    return _slaves ~/ 2 + 2;
  }

  int get _rightScreen {
    return _slaves ~/ 2 + 1;
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
      return await _client.isConnected();
    } catch (e) {
      return false;
    }
  }

  Future<bool> connect() async {
    try {
      String? response = await _client.connect();
      return response != null;
    } catch (e) {
      _onError('Error connecting');
      return false;
    }
  }

  disconnect() async {
    try {
      await _client.disconnect();
    } catch (e) {
      _onError('Error disconnecting');
    }
  }

  Future<void> _execute(String query) async {
    try {
      String? response = await _client.execute(query);
      if (response != null && response.isNotEmpty) {
        log(response);
      }
    } catch (e) {
      if (await isConnected()) {
        _onError('Error executing command: $e');
      }
    }
  }

  Future<void> flyTo(CameraPosition cameraPosition) async {
    await _execute("echo 'flytoview=${KmlUtils.lookAt(cameraPosition)}' > /tmp/query.txt");
  }

  Future<void> startOrbit() async {
    await _execute('echo "playtour=TouristicOrbit" > /tmp/query.txt');
  }

  Future<void> stopOrbit() async {
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
    await cleanKml();
    await _execute(
        "chmod 777 /var/www/html/kml/slave_$_rightScreen.kml; echo '$kml' > /var/www/html/kml/slave_$_rightScreen.kml");
  }

  Future<void> cleanBalloon() async {
    await _execute(
        "chmod 777 /var/www/html/kml/slave_$_rightScreen.kml; echo '${BalloonUtils().emptyBalloon()}' > /var/www/html/kml/slave_$_rightScreen.kml");
  }

  Future<void> sendKml(String kml) async {
    await _execute("echo '$kml' > /var/www/html/touristic.kml");
    await _execute("echo '\nhttp://lg1:81/touristic.kml' > /var/www/html/kmls.txt");
  }

  Future<void> cleanKml() async {
    for (var i = 2; i <= _slaves; i++) {
      await _execute("echo '${KmlUtils.emptyKml()}' > /var/www/html/kml/slave_$i.kml");
    }
    await _execute('echo "" > /tmp/query.txt');
    await _execute("echo '${KmlUtils.emptyKml()}' > /var/www/html/kmls.txt");
  }

  Future<void> setRefresh() async {
    for (var i = 2; i <= _slaves; i++) {
      String search = '<href>##LG_PHPIFACE##kml\\/slave_$i.kml<\\/href>';
      String replace =
          '<href>##LG_PHPIFACE##kml\\/slave_$i.kml<\\/href><refreshMode>onInterval<\\/refreshMode><refreshInterval>2<\\/refreshInterval>';
      await _execute(
          'sshpass -p $_password ssh -t lg$i "echo $_password | sudo -S sed -i "s/$replace/$search/" ~/earth/kml/slave/myplaces.kml"');
      await _execute(
          'sshpass -p $_password ssh -t lg$i "echo $_password | sudo -S sed -i "s/$search/$replace/" ~/earth/kml/slave/myplaces.kml"');
    }
  }

  Future<void> resetRefresh() async {
    for (var i = 2; i <= _slaves; i++) {
      String search =
          '<href>##LG_PHPIFACE##kml\\/slave_$i.kml<\\/href><refreshMode>onInterval<\\/refreshMode><refreshInterval>2<\\/refreshInterval>';
      String replace = '<href>##LG_PHPIFACE##kml\\/slave_$i.kml<\\/href>';
      await _execute(
          'sshpass -p $_password ssh -t lg$i "echo $_password | sudo -S sed -i "s/$search/$replace/" ~/earth/kml/slave/myplaces.kml"');
    }
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
