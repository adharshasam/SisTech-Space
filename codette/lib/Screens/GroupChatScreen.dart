import 'package:SisTech_Space/AppColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ResourcesScreen.dart';
import 'HomePage.dart';
import 'UserProfileScreen.dart';
import 'CommunityScreen.dart';
import 'ChatScreen.dart';

class GroupChatScreen extends StatefulWidget {
  const GroupChatScreen({super.key});

  @override
  State<GroupChatScreen> createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {

  Widget _Chats(BuildContext context, List data) {
    return Card(
        child: InkWell(
          onTap:() {
            if (data[0]["read"] == false) {
              data[0]["read"] = true;
              setState(() {});
            }
            Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(groupChat: data)),);
          },
          child: Column(
            children: [
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(data[0]["group_logo"]),
                      )
                  ),
                ),
                title: Text(data[0]["group_name"]),
                trailing: data[0]["read"] == false ? Icon(Icons.circle, size: 10.0, color: Colors.red) : null
              ),
            ]
          ),
        )
    );
  }

  // GROUP CHAT CONTENT
  List chat_data = [
    [{"id": "1",
      "group_logo": "https://asset.routledge.com/rt-files/Faculty/Laura+Maisey/10+tips+for+successful+studying+3+OP.jpg",
      "group_name": "Academic Weapons",
      "read": false,
      "conversation": [
        {"message_type": "received",
          "user": "Rose",
          "message": "Hello! What are we studying today?"},
        {"message_type": "sent",
          "user": "user",
          "message": "Hi! I'll be working on Algorithms today! Meet you at 6?"},
        {"message_type": "received",
          "user": "Rose",
          "message": "Sure thing!"},
      ]
    }],
    [{"id": "2",
      "group_logo": "https://assets.thehansindia.com/hansindia-bucket/9325_CV_Writing.jpg",
      "group_name": "CV Preparation",
      "read": true,
      "conversation": [
        {"message_type": "received",
          "user": "Tulip",
          "message": "Hi friends, here's some resources you guys can use to write your resumes! Link: https://www.virtusa.com/insights/perspectives/top-5-resume-tips-to-help-empower-women-in-tech"},
        {"message_type": "sent",
          "user": "user",
          "message": "Thank you so much! I'll get to writing my resume now :)"}]
    }],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.primaryColor,
          title: Text(
              "Chats",
              style: TextStyle(fontWeight: FontWeight.bold)),
          automaticallyImplyLeading: false,
          elevation: 8,
          shadowColor: Colors.grey,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.add, color: Colors.black), onPressed:(){})
          ]
      ),
      body: Container(
        color: Colors.grey[800],
          padding: EdgeInsets.all(10.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: ListView(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 5.0),
                        children: <Widget> [
                          for(var chat in chat_data)...[
                            _Chats(context, chat)
                        ]
                      ]
                    )
                )
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

                  currentIndex: 0,
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