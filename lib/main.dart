
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:instructorbrandon_com/data_connectivity_checker.dart';
import 'package:instructorbrandon_com/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    StreamProvider<DataConnectionStatus>(
      create: (context){
        return DataConnectivityService().connectivityStreamController.stream;
      },
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(milliseconds: 2000), () {
      setState(() {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
            HomePage()));
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Image.asset("images/app_logo.png"),
                  ),
                  CircularProgressIndicator(),
                  Text("Powered By  instructorbrandon.com")
                ],
              ),
            ),
        ),
      ),
    );
  }
}
