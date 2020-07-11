import 'dart:async';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _loading = true;
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(
       child: Builder(builder: (BuildContext context){
         return  Stack(
           children: [
             WebView(
               initialUrl: "https://www.instructorbrandon.com",
               javascriptMode: JavascriptMode.unrestricted,
               onPageStarted: (value){
                 print("Page started value: $value");
                 setState(() {
                   _loading = false;
                 });
               },
               onWebViewCreated: (WebViewController webViewController) {
                 _controller.complete(webViewController);
               },
             ),
             Visibility(
               visible: Provider.of<DataConnectionStatus>(context) ==
                   DataConnectionStatus.disconnected,
               child: Container(
                 height: 60,
                 alignment: Alignment.center,
                 color: Colors.grey,
                 padding: EdgeInsets.all(16.0),
                 child: Text('Check your Internet Connection',
                   style: TextStyle(color: Colors.white,fontSize: 18.0),),
               ),
             ),
             _loading ? LoadingWidget() : Container(
               height: 0.0,
             ),
           ],
         );
       },),
     ),
    );
  }
}


class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: SpinKitChasingDots(
        color: Colors.blue,
        size: 50.0,
      ),
    );
  }
}
