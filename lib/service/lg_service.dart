import 'dart:developer';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ssh2/ssh2.dart';

import '../core/utils/kml_utils.dart';

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
      return await _client.isConnected();
    } catch (e) {
      return false;
    }
  }

  Future<bool> connect() async {
    try {
      await _client.connect();
      showLogo();
      return true;
    } catch (e) {
      _onError('Error connecting');
      log('Error connecting: $e');
      return false;
    }
  }

  disconnect() async {
    try {
      await _client.disconnect();
      cleanKml();
    } catch (e) {
      _onError('Error disconnecting');
      log('Error disconnecting: $e');
    }
  }

  _execute(String query) async {
    String? response = await _client.execute(query);
    if (response == null) {
      return Future.error("Null response");
    }
    log(response);
  }

  flyTo(CameraPosition cameraPosition) async {
    try {
      await _execute("echo 'flytoview=${KmlUtils.lookAt(cameraPosition)}' > /tmp/query.txt");
    } catch (e) {
      log('Error flying to $cameraPosition: $e');
    }
  }

  startOrbit() async {
    try {
      await _execute('echo "playtour=TouristicOrbit" > /tmp/query.txt');
    } catch (e) {
      _onError('Error starting orbit');
      log('Error starting orbit: $e');
    }
  }

  stopOrbit() async {
    try {
      await _execute('echo "exittour=true" > /tmp/query.txt');
    } catch (e) {
      _onError('Error stopping orbit');
      log('Error stopping orbit: $e');
    }
  }

  showLogo() async {
    try {
      _execute("chmod 777 /var/www/html/kml/$_leftScreen.kml; echo '${KmlUtils.createLogos()}' > /var/www/html/kml/$_leftScreen.kml");
    } catch (e) {
      _onError('Error showing logo');
      log('Error showing logo: $e');
    }
  }

  hideLogo() async {
    try {
      _cleanSlave(_leftScreen);
    } catch (e) {
      _onError('Error hiding logo');
      log('Error hiding logo: $e');
    }
  }

  showBalloon(String kml) async {
    try {
      _execute("chmod 777 /var/www/html/kml/$_rightScreen.kml; echo '$kml}' > /var/www/html/kml/$_rightScreen.kml");
    } catch (e) {
      _onError('Error showing logo');
      log('Error showing logo: $e');
    }
  }

  cleanBalloon() async {
    try {
      _cleanSlave(_rightScreen);
    } catch (e) {
      _onError('Error cleaning balloon');
      log('Error cleaning balloon: $e');
    }
  }

  _cleanSlave(int slaveNo) async {
    _execute("chmod 777 /var/www/html/kml/$slaveNo.kml; echo '' > /var/www/html/kml/slave_$slaveNo.kml");
  }

  sendKml(String kml) async {
    try {
      _execute("echo '$kml' > /var/www/html/touristicIA.kml");
      _execute('echo "http://lg1:81/touristicIA.kml" >> /var/www/html/kmls.txt');
    } catch (e) {
      _onError('Error sending kml');
      log('Error sending kml: $e');
    }
  }

  cleanKml() async {
    try {
      for (var i = 2; i <= _slaves; i++) {
        await _execute("echo '' > /var/www/html/kml/slave_$i.kml");
      }
      await _execute('echo "" > /tmp/query.txt');
      await _execute("echo '' > /var/www/html/kmls.txt");
    } catch (e) {
      _onError('Error cleaning KML');
      log('Error cleaning KML: $e');
    }
  }

  setRefresh() async {
    try {
      for (var i = 2; i <= _slaves; i++) {
        String search = '<href>##LG_PHPIFACE##kml\\/slave_$i.kml<\\/href>';
        String replace = '<href>##LG_PHPIFACE##kml\\/slave_$i.kml<\\/href><refreshMode>onInterval<\\/refreshMode><refreshInterval>2<\\/refreshInterval>';

        await _execute('sshpass -p $_password ssh -t lg$i \'echo $_password | sudo -S sed -i "s/$replace/$search/" ~/earth/kml/slave/myplaces.kml\'');
        await _execute('sshpass -p $_password ssh -t lg$i \'echo $_password | sudo -S sed -i "s/$search/$replace/" ~/earth/kml/slave/myplaces.kml\'');
      }
    } catch (e) {
      _onError('Error setting refresh');
      log('Error setting refresh: $e');
    }
  }

  resetRefresh() async {
    try {
      for (var i = 2; i <= _slaves; i++) {
        String search = '<href>##LG_PHPIFACE##kml\\/slave_$i.kml<\\/href><refreshMode>onInterval<\\/refreshMode><refreshInterval>2<\\/refreshInterval>';
        String replace = '<href>##LG_PHPIFACE##kml\\/slave_$i.kml<\\/href>';
        await _execute(
            'sshpass -p $_password ssh -t lg$i \'echo $_password | sudo -S sed -i "s/$search/$replace/" ~/earth/kml/slave/myplaces.kml\'');
      }
    } catch (e) {
      _onError('Error resetting refresh');
      log('Error resetting refresh: $e');
    }
  }

  relaunchLG() async {
    try {
      for (var i = _slaves; i >= _slaves; i++) {
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
    } catch (e) {
      _onError('Error relaunching LG');
      log('Error relaunching LG: $e');
    }
  }

  rebootLG() async {
    try {
      for (var i = _slaves; i >= 1; i--) {
        await _execute('sshpass -p $_password ssh -t lg$i "echo $_password | sudo -S reboot"');
      }
    } catch (e) {
      _onError('Error rebooting LG');
      log('Error rebooting LG: $e');
    }
  }

  shutdownLG() async {
    try {
      for (var i = _slaves; i >= 1; i--) {
        await _execute('sshpass -p $_password ssh -t lg$i "echo $_password | sudo -S poweroff"');
      }
    } catch (e) {
      _onError('Error shutting down LG');
      log('Error shutting down LG: $e');
    }
  }
}