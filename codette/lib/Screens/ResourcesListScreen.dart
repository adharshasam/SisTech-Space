import 'package:SisTech_Space/AppColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'GroupChatScreen.dart';
import 'ResourcesScreen.dart';
import 'HomePage.dart';
import 'UserProfileScreen.dart';
import 'CommunityScreen.dart';
import 'IndividualResourceScreen.dart';

class ResourcesListScreen extends StatefulWidget {
  const ResourcesListScreen ({Key ? key, required this.resourceName, required this.resourceInfo}): super(key: key);
  final String resourceName;
  final List resourceInfo;

  @override
  State<ResourcesListScreen> createState() => _ResourcesListScreenState();
}

class _ResourcesListScreenState extends State<ResourcesListScreen> {

  Widget _ResourceList(BuildContext context, List information) {
    return Container(
      height: 300,
        child: ListView.separated(
          padding: EdgeInsets.all(8),
            itemCount: information.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color(0xFFFEE1DF),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: ListTile(
                        title: Text(information[index]["name"]),
                    )
                ),
                onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context) => IndividualResourceScreen(resourceName: widget.resourceName, resourceInfo: information[index],)))
              );
            },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        title: Text(
            widget.resourceName,
            style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 8,
        shadowColor: Colors.grey,
      ),
      body: Container(
        color: Colors.grey[800],
          padding: EdgeInsets.all(10.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                OutlinedButton(
                  child: Text("Try out our LLM!", style: TextStyle(fontSize: 20)),
                  style: OutlinedButton.styleFrom(backgroundColor: AppColor.primaryColor, foregroundColor: Colors.black),
                  onPressed: (){},
                ),
                _ResourceList(context, widget.resourceInfo)
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

                  currentIndex: 1,
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