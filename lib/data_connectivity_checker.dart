

import 'dart:async';

import 'package:data_connection_checker/data_connection_checker.dart';

class DataConnectivityService{
  StreamController<DataConnectionStatus> connectivityStreamController =
  StreamController<DataConnectionStatus>();

  DataConnectivityService(){
    DataConnectionChecker().onStatusChange.listen((event) { 
      connectivityStreamController.add(event);
    });
  }

}