import 'package:SisTech_Space/AppColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'GroupChatScreen.dart';
import 'ResourcesScreen.dart';
import 'HomePage.dart';
import 'UserProfileScreen.dart';
import 'CommunityScreen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen ({Key ? key, required this.groupChat}): super(key: key);
  final List groupChat; // title, user, tag, subtitle, comment

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  TextEditingController _textController = TextEditingController();

  Widget _Recevied(BuildContext context, Map data) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
              color: Color(0xFF85149),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: ListTile(
                leading: Icon(Icons.account_circle, size: 30.0),
                title: Text(data["user"]),
                subtitle: Text(data["message"])
            )
        ),
        const SizedBox(height: 10)
      ],
    );
  }

  Widget _Sent(BuildContext context, Map data) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xF00687C),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: ListTile(
            title: Text(data["message"], textAlign: TextAlign.right,),
            titleTextStyle: Theme.of(context).textTheme.bodyMedium,
          )
        ),
        const SizedBox(height: 10)
      ],
    );
  }

  void onSendMessage(String content, List chat) {
    if (content.trim().isNotEmpty) {
      _textController.clear();
      chat.add({"message_type": "sent", "user": "user", "message": content});
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          backgroundColor: AppColor.primaryColor,
          title: Text(
              widget.groupChat[0]["group_name"],
              style: TextStyle(fontWeight: FontWeight.bold)),
          elevation: 8,
          shadowColor: Colors.grey,
      ),
      body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: ListView(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 5.0),
                        children: <Widget> [
                          for(var chat in widget.groupChat)...[
                            for (var message in chat["conversation"])...[
                              if (message["message_type"] == "received")...[
                                _Recevied(context, message)
                              ] else if (message["message_type"] == "sent")...[
                                _Sent(context, message)
                              ]
                            ]
                          ]
                        ]
                    )
                ),
                SizedBox(
                    child: TextField(
                      textInputAction: TextInputAction.send,
                      keyboardType: TextInputType.text,
                      controller: _textController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      onSubmitted: (value) {
                        onSendMessage(_textController.text, widget.groupChat[0]["conversation"]);
                      },
                    )
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