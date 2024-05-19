import 'package:ssh2/ssh2.dart';

class LGService {
  late SSHClient _client;
  static LGService? instance;
  String _host;
  String _username;
  String _password;
  int _port;
  int _slaves;

  factory LGService({
    required String host,
    required int port,
    required String username,
    required String password,
    required int slaves,
  }) {
    if (instance == null ||
        instance!._host != host ||
        instance!._username != username ||
        instance!._port != port ||
        instance!._password != password ||
        instance!._slaves != slaves) {
      instance = LGService._internal(
        host: host,
        port: port,
        username: username,
        password: password,
        slaves: slaves,
      );
    }
    return instance!;
  }

  LGService._internal({
    required String host,
    required int port,
    required String username,
    required String password,
    required int slaves,
  })  : _host = host,
        _port = port,
        _username = username,
        _password = password,
        _slaves = slaves {
    _client = SSHClient(
        host: host, port: port, username: username, passwordOrKey: password);
  }

  static Future<bool> isConnected() {
    return instance?._client.isConnected() ?? Future(() => false);
  }

  Future<bool> connect() async {
    try {
      await _client.connect();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> disconnect() async {
    try {
      await _client.disconnect();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> _execute(String query) async {
    try {
      await _client.execute(query);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> cleanKml() async {
    try {
      bool res = true;
      for (var i = 2; i <= _slaves; i++) {
        res = res && await _execute("echo '' > /var/www/html/kml/slave_$i.kml");
      }
      res = res && await _execute('echo "" > /tmp/query.txt');
      res = res && await _execute("echo '' > /var/www/html/kmls.txt");
      return res;
    } catch (error) {
      return false;
    }
  }

  Future<bool> setRefresh() async {
    try {
      bool res = true;
      for (var i = 2; i <= _slaves; i++) {
        String search = '<href>##LG_PHPIFACE##kml\\/slave_$i.kml<\\/href>';
        String replace =
            '<href>##LG_PHPIFACE##kml\\/slave_$i.kml<\\/href><refreshMode>onInterval<\\/refreshMode><refreshInterval>2<\\/refreshInterval>';

        res = res &&
            await _execute(
                'sshpass -p $_password ssh -t lg$i \'echo $_password | sudo -S sed -i "s/$replace/$search/" ~/earth/kml/slave/myplaces.kml\'');
        res = res &&
            await _execute(
                'sshpass -p $_password ssh -t lg$i \'echo $_password | sudo -S sed -i "s/$search/$replace/" ~/earth/kml/slave/myplaces.kml\'');
      }
      return res;
    } catch (error) {
      return false;
    }
  }

  Future<bool> resetRefresh() async {
    try {
      bool res = true;
      for (var i = 2; i <= _slaves; i++) {
        String search =
            '<href>##LG_PHPIFACE##kml\\/slave_$i.kml<\\/href><refreshMode>onInterval<\\/refreshMode><refreshInterval>2<\\/refreshInterval>';
        String replace = '<href>##LG_PHPIFACE##kml\\/slave_$i.kml<\\/href>';

        res = res &&
            await _execute(
                'sshpass -p $_password ssh -t lg$i \'echo $_password | sudo -S sed -i "s/$search/$replace/" ~/earth/kml/slave/myplaces.kml\'');
      }
      return res;
    } catch (error) {
      return false;
    }
  }

  Future<bool> relaunchLG() async {
    try {
      bool res = true;
      for (var i = 1; i <= _slaves; i++) {
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
        res = res &&
            await _execute(
                '"/home/$_username/bin/lg-relaunch" > /home/$_username/log.txt');
        res = res && await _execute(cmd);
      }
      return res;
    } catch (error) {
      return false;
    }
  }

  Future<bool> rebootLG() async {
    try {
      bool res = true;
      for (var i = 1; i <= _slaves; i++) {
        res = res &&
            await _execute(
                'sshpass -p $_password ssh -t lg$i "echo $_password | sudo -S reboot');
      }
      return res;
    } catch (error) {
      return false;
    }
  }

  Future<bool> shutdownLG() async {
    try {
      bool res = true;
      for (var i = 1; i <= _slaves; i++) {
        res = res &&
            await _execute(
                'sshpass -p $_password ssh -t lg$i "echo $_password | sudo -S poweroff"');
      }
      return res;
    } catch (error) {
      return false;
    }
  }
}
