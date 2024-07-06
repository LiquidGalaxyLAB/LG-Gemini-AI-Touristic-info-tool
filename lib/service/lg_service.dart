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
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> disconnect() async {
    try {
      await _client.disconnect();
    } catch (e) {
      _onError('Error disconnecting');
    }
  }

  Future<void> _execute(String query) async {
    try {
      await _client.execute(query);
    } catch (e) {
      _onError('Error executing query');
    }
  }

  Future<void> flyTo(CameraPosition cameraPosition) async {
    try {
      await _execute("echo 'flytoview=${KmlUtils.lookAt(cameraPosition)}' > /tmp/query.txt");
    } catch (e) {
      _onError('Error flying to position');
    }
  }

  Future<void> showLogo() async {
    try {
      for (var i = 2; i <= _slaves; i++) {
        await _execute("echo '' > /var/www/html/kml/slave_$i.kml");
      }
      await _execute('echo "" > /tmp/query.txt');
      await _execute("echo '' > /var/www/html/kmls.txt");
    } catch (e) {
      _onError('Error cleaning KML');
    }
  }

  Future<void> cleanKml() async {
    try {
      for (var i = 2; i <= _slaves; i++) {
        await _execute("echo '' > /var/www/html/kml/slave_$i.kml");
      }
      await _execute('echo "" > /tmp/query.txt');
      await _execute("echo '' > /var/www/html/kmls.txt");
    } catch (e) {
      _onError('Error cleaning KML');
    }
  }

  Future<void> setRefresh() async {
    try {
      for (var i = 2; i <= _slaves; i++) {
        String search = '<href>##LG_PHPIFACE##kml\\/slave_$i.kml<\\/href>';
        String replace =
            '<href>##LG_PHPIFACE##kml\\/slave_$i.kml<\\/href><refreshMode>onInterval<\\/refreshMode><refreshInterval>2<\\/refreshInterval>';

        await _execute(
            'sshpass -p $_password ssh -t lg$i \'echo $_password | sudo -S sed -i "s/$replace/$search/" ~/earth/kml/slave/myplaces.kml\'');
        await _execute(
            'sshpass -p $_password ssh -t lg$i \'echo $_password | sudo -S sed -i "s/$search/$replace/" ~/earth/kml/slave/myplaces.kml\'');
      }
    } catch (e) {
      _onError('Error setting refresh');
    }
  }

  Future<void> resetRefresh() async {
    try {
      for (var i = 2; i <= _slaves; i++) {
        String search = '<href>##LG_PHPIFACE##kml\\/slave_$i.kml<\\/href><refreshMode>onInterval<\\/refreshMode><refreshInterval>2<\\/refreshInterval>';
        String replace = '<href>##LG_PHPIFACE##kml\\/slave_$i.kml<\\/href>';
        await _execute(
            'sshpass -p $_password ssh -t lg$i \'echo $_password | sudo -S sed -i "s/$search/$replace/" ~/earth/kml/slave/myplaces.kml\'');
      }
    } catch (e) {
      _onError('Error resetting refresh');
    }
  }

  Future<void> relaunchLG() async {
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
    }
  }

  Future<void> rebootLG() async {
    try {
      for (var i = _slaves; i >= 1; i--) {
        await _execute('sshpass -p $_password ssh -t lg$i "echo $_password | sudo -S reboot"');
      }
    } catch (e) {
      _onError('Error rebooting LG');
    }
  }

  Future<void> shutdownLG() async {
    try {
      for (var i = _slaves; i >= 1; i--) {
        await _execute('sshpass -p $_password ssh -t lg$i "echo $_password | sudo -S poweroff"');
      }
    } catch (e) {
      _onError('Error shutting down LG');
    }
  }
}