import 'package:SisTech_Space/AppColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.grey[800],
          alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/logo.png')
                    )
                  ),
                ),
                OutlinedButton(
                  child: Text("Welcome!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color(0xFFFEE1DF),
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())),
                )
              ]
            )
        ),
    );
  }
}