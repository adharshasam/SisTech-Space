import 'package:SisTech_Space/AppColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'GroupChatScreen.dart';
import 'ResourcesScreen.dart';
import 'HomePage.dart';
import 'UserProfileScreen.dart';
import 'CommunityScreen.dart';

class IndividualResourceScreen extends StatefulWidget {
  const IndividualResourceScreen ({Key ? key, required this.resourceName, required this.resourceInfo}): super(key: key);
  final String resourceName;
  final Map resourceInfo;

  @override
  State<IndividualResourceScreen> createState() => _IndividualResourceScreenState();
}

class _IndividualResourceScreenState extends State<IndividualResourceScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        title: Text(
            widget.resourceName + " resources",
            style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 8,
        shadowColor: Colors.grey,
      ),
      body: Container(
        color: Colors.grey[800],
          padding: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFEE1DF),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                            title: Text(widget.resourceInfo["name"], style: TextStyle(fontSize: 25)),
                        ),
                        SizedBox(height: 10),
                        Container(
                            padding:EdgeInsets.all(8),
                            child: Text(widget.resourceInfo["content"], style: TextStyle(fontSize: 15))
                        ),
                        SizedBox(height: 10),
                        Container(
                            padding: EdgeInsets.all(8),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Resource Links", style:TextStyle(fontSize: 15, decoration: TextDecoration.underline)),
                                  Text(widget.resourceInfo["links"], style: TextStyle(fontSize: 15)),
                                ]
                            )
                        ),
                      ]
                  ),
                ),
                SizedBox(height: 10),
                OutlinedButton(
                  child: Text("Try out our LLM!", style: TextStyle(fontSize: 20)),
                  style: OutlinedButton.styleFrom(backgroundColor: AppColor.primaryColor, foregroundColor: Colors.black),
                  onPressed: (){},
                ),
              ]
            )
          )
      ),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: BottomNavigationBar(
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  selectedItemColor: AppColor.secondaryColor,
                  unselectedItemColor: Colors.black,
                  selectedFontSize: 0.0,
                  unselectedFontSize: 0.0,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: AppColor.primaryColor,

                  currentIndex: 1,
                  items: [
                    BottomNavigationBarItem(icon: IconButton(icon: Icon(Icons.chat, size:30), onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => GroupChatScreen()))), label: "Chatbot"),
                    BottomNavigationBarItem(icon: IconButton(icon: Icon(Icons.work, size:30), onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResourcesScreen()))), label: "Resources"),
                    BottomNavigationBarItem(icon: IconButton(icon: Icon(Icons.home, size:30), onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()))), label: "Home"),
                    BottomNavigationBarItem(icon: IconButton(icon: Icon(Icons.forum, size:30), onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => CommunityScreen()))), label: "Community"),
                    BottomNavigationBarItem(icon: IconButton(icon: Icon(Icons.person, size:30), onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserProfileScreen()))), label: "User")
                  ]
              ),
            )
    );
  }
}