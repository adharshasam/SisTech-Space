import 'package:flutter/material.dart';
import 'package:SisTech_Space/AppColor.dart';

import 'GroupChatScreen.dart';
import 'ResourcesScreen.dart';
import 'HomePage.dart';
import 'UserProfileScreen.dart';
import 'CommunityScreen.dart';

class ViewPostScreen extends StatefulWidget {
  const ViewPostScreen ({Key ? key, required this.postTag}): super(key: key);
  final List postTag; // title, user, tag, subtitle, comment

  @override
  State<ViewPostScreen> createState() => _ViewPostScreenState();
}

class _ViewPostScreenState extends State<ViewPostScreen> {

  Widget _FilterChip(BuildContext context, String filter) {
    return Row(
        children: <Widget> [
          Container(
            child: Text(filter, style: TextStyle(fontSize: 10)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: AppColor.primaryColor,
            ),
            padding: EdgeInsets.fromLTRB(4.0, 1.0, 4.0, 1.0),
          ),
          const SizedBox(width: 10),
        ]
    );
  }

  Widget _Comments(BuildContext context, String user, String comment) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Color(0xFF85149),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Column(
            children: <Widget> [
              ListTile(
                leading: Icon(Icons.account_circle, size: 30),
                title: Text(user)
              ),
              Container(
                child: Text(comment, textAlign: TextAlign.start),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10)
              )
            ]
          )
        ),
        const SizedBox(height: 10)
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColor.primaryColor,
            title: Text(
                "Community",
                style: TextStyle(fontWeight: FontWeight.bold)),
            elevation: 8,
            shadowColor: Colors.grey,
        ),
        body: Container(
          color: Colors.grey[800],
          padding: EdgeInsets.all(10.0),
          child: ListView (
            children: <Widget> [
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFFEE1DF),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Column(
                children: <Widget> [
                  ListTile(
                    leading: Icon(Icons.account_circle, size:50),
                    title: Text(widget.postTag[0]["title"]),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.postTag[0]["user"]),
                        Row(
                          children: <Widget>[
                            for (var item in widget.postTag[0]["tags"]) _FilterChip(context, item)
                          ]
                        )
                      ]
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                    alignment: Alignment.centerLeft,
                    child: Text(widget.postTag[0]["content"])
                  ),
                  const SizedBox(height: 10),
                  Container(
                      child: Text("Comments:", textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(10.0)
                  ),
                  // COMMENTS
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      for(var item in widget.postTag[0]["comments"].entries) _Comments(context, item.key, item.value),
                    ]
                  )
                ]
              ),
            ),
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

                  currentIndex: 3,
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