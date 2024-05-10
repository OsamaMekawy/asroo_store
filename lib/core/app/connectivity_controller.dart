

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnrctivityController{
  ConnrctivityController._();

  static final ConnrctivityController instance = ConnrctivityController._();

  ValueNotifier<bool> isConnected = ValueNotifier(true);

  // Future<void> init() async {
  //   final result = await Connectivity().checkConnectivity();
  //   isInternetConnected(result);
  //   Connectivity().onConnectivityChanged.listen(isInternetConnected);
  // }
  Future<void> init() async {
  final result = await Connectivity().checkConnectivity();
  // isInternetConnected(result); // Pass the result directly, no need for list
  Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> results) {
    isInternetConnected(results.last); // Pass the latest result from the list
  });
}


    bool isInternetConnected(ConnectivityResult? result) {
    if (result == ConnectivityResult.none) {
      isConnected.value = false;
      return false;
    } else if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      isConnected.value = true;
      return true;
    }
    return false;
  }
}