

import 'package:connectivity_plus/connectivity_plus.dart';


class ConnectionHelper {
  static late List<ConnectivityResult> _connectivityResults;

  static Future<void> _connect() async {
    _connectivityResults = await Connectivity().checkConnectivity();
  }

  static Future<bool> hasConnection() async {
    await _connect();
    for (var result in _connectivityResults) {
      if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
        return true;
      }
    }
    return false;
  }

  static Stream<List<ConnectivityResult>> connectionListener() {
    return Connectivity().onConnectivityChanged;
  }
}

