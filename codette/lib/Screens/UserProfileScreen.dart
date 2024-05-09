import 'package:SisTech_Space/AppColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'GroupChatScreen.dart';
import 'ResourcesScreen.dart';
import 'HomePage.dart';
import 'CommunityScreen.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {

  Widget _UserProfile(BuildContext context, Map data) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/group_photo.jpg')
                )
            ),
            alignment: Alignment.center,
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFFEE1DF),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            padding: EdgeInsets.all(10),
            child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.top,
                children: [
                  TableRow(
                      children: [
                        Text("Name:", textAlign: TextAlign.start, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Text(data["name"], textAlign: TextAlign.start, style: TextStyle(fontSize: 15)),
                      ]
                  ),
                  TableRow(
                      children: [
                        Text("Age:", textAlign: TextAlign.start, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Text(data["age"], textAlign: TextAlign.start, style: TextStyle(fontSize: 15)),
                      ]
                  ),
                  TableRow(
                      children: [
                        Text("Job:", textAlign: TextAlign.start, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Text(data["job"], textAlign: TextAlign.start, style: TextStyle(fontSize: 15)),
                      ]
                  ),
                  TableRow(
                      children: [
                        Text("Interests:", textAlign: TextAlign.start, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Text(data["interests"], textAlign: TextAlign.start, style: TextStyle(fontSize: 15)),
                      ]
                  ),
                  TableRow(
                      children: [
                        Text("Role Model:", textAlign: TextAlign.start, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Text(data["role_model"], textAlign: TextAlign.start, style: TextStyle(fontSize: 15)),
                      ]
                  )
                ]
            )
          ),
          const SizedBox(height: 20),
          Container(
            alignment: Alignment.centerLeft,
            child: Text("Personal Documents", textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
          ),
          Container(
              decoration: BoxDecoration(
                color: Color(0xFFFEE1DF),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              padding: EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Portfolio [file]", textAlign: TextAlign.start, style: TextStyle(fontSize: 18)),
                  Text("CV [file]", textAlign: TextAlign.start, style: TextStyle(fontSize:18))
                ]
              )
          ),
          const SizedBox(height: 20),
          Container(
            alignment: Alignment.centerLeft,
            child: Text("View community posts", textAlign: TextAlign.start, style: TextStyle(color: Colors.white, decoration: TextDecoration.underline, decorationColor: Colors.white, fontSize: 20)),
          ),
        ]
      )
    );
  }

  Map user_data = {
    "name": "Binary Blossoms",
    "age": "23",
    "job": "University Student",
    "interests": "LLMs, app development",
    "role_model": "Reshma Saujani, founder and CEO of Girl Who Code"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        title: Text(
            "Your Profile",
            style: TextStyle(fontWeight: FontWeight.bold)),
        automaticallyImplyLeading: false,
        elevation: 8,
        shadowColor: Colors.grey,
      ),
      body: Container(
        color: Colors.grey[800],
          padding: EdgeInsets.all(10.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _UserProfile(context, user_data)
              ]
          )

      ),
        bottomNavigationBar: BottomNavigationBar(
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  selectedItemColor: AppColor.secondaryColor,
                  unselectedItemColor: Colors.black,
                  selectedFontSize: 0.0,
                  unselectedFontSize: 0.0,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: AppColor.primaryColor,

                  currentIndex: 4,
                  items: [
                    BottomNavigationBarItem(icon: IconButton(icon: Icon(Icons.chat, size:30), onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => GroupChatScreen()))), label: "Chatbot"),
                    BottomNavigationBarItem(icon: IconButton(icon: Icon(Icons.work, size:30), onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResourcesScreen()))), label: "Resources"),
                    BottomNavigationBarItem(icon: IconButton(icon: Icon(Icons.home, size:30), onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()))), label: "Home"),
                    BottomNavigationBarItem(icon: IconButton(icon: Icon(Icons.forum, size:30), onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => CommunityScreen()))), label: "Community"),
                    BottomNavigationBarItem(icon: IconButton(icon: Icon(Icons.person, size:30), onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserProfileScreen()))), label: "User")
                  ]
              ),
            );
  }
}