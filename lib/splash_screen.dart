import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset("images/app_logo.png"),
            ),
            CircularProgressIndicator(),
            Text("Powered By  instructorbrandon.com")
          ],
        ),
      ),
    );
  }
}
