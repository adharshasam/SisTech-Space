import 'package:SisTech_Space/AppColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'GroupChatScreen.dart';
import 'ResourcesScreen.dart';
import 'UserProfileScreen.dart';
import 'CommunityScreen.dart';
import 'ViewPostScreen.dart';
import 'IndividualResourceScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Widget _Welcome(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text("Welcome,\nBinary Blossoms!",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white)),
          Text("Empowering Women, Empowering Technology",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize:12, color: Colors.white))
        ]
      ),
      padding: EdgeInsets.all(20),
    );
  }

  Widget _HighlightPost(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: [
            Container(
              height: 200.0,
              child: Ink.image(
                image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxNW1sWfic62X9B2xPKpfGl53vgVGP-K9PFkk7m0IB43IChAWwVe-orSQGhiEDDru2AVc&usqp=CAU"),
                fit: BoxFit.cover,
              )
            ),
            ListTile(
              title: Text("wotd: Susan Wojcicki".toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              subtitle: Text("Learn more about Susan Wojcicki, Youtube's CEO since 2014 and Google's first marketing manager in 1999.", maxLines: 2, style: TextStyle(fontSize: 15))
            )
          ]
        )
      )
    );
  }

  ///////aaaaahhhhhh
  Widget _HighlightForum(BuildContext context, List data) {
    return Card(
        child: InkWell(
          onTap:() => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ViewPostScreen(postTag: data)),
          ),
          child: Column(
              children: [
                ListTile(
                  title: Text(data[0]["title"], style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(data[0]["content"], maxLines: 2,)
                ),
              ]
          ),
        )
    );
  }

  Widget _HighlightResources(BuildContext context, String resource, List information) {
    return Container(
        padding: EdgeInsets.all(8),
        height: 110,
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              InkWell(
                  child: Card(
                    child: Container(
                        padding: EdgeInsets.all(8),
                    constraints: BoxConstraints(maxWidth: 200),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(information[0]["name"], style: TextStyle(fontSize: 15))
                        ]
                    )
                ),
              ),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => IndividualResourceScreen(resourceName: resource, resourceInfo: information[0])))
              ),
              const SizedBox(width: 5),
              InkWell(
                child: Card(
                  child: Container(
                      padding: EdgeInsets.all(8),
                      constraints: BoxConstraints(maxWidth: 200),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(information[1]["name"], style: TextStyle(fontSize: 15))
                          ]
                      )
                  ),
                ),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => IndividualResourceScreen(resourceName: resource, resourceInfo: information[1]))),
              ),
            ]
      )
    );
  }

  List post_data = [{"id": "1",
    "title": "Candidate cried during interview--what would you do?",
    "user": "Binary",
    "tags": ["Interview"],
    "content": """A potential candidate I'm interested in (for a junior analyst role, 3-5 years experience) went through a panel interview today. Before the panel, I went through a technical screen with her, and she did fairly well and could express her thoughts/rationale clearly (unless some other folks, who immediately resorted to Chat GPT). There were 3 people on this panel--a senior director and two managers. The senior director is very terse, direct, and a fast-talker--he has reputation for being somewhat intimidating but smart. 

Long story short, she started crying during the interview and could not recover. However, I was put off by the way the senior director interviewed her. Here's a snippet of a conversation within the first 5 minutes:

"How would you rate yourself on a scale of 1-10 in Excel?"

"A 9, but I don't know macros."

"Oh wow, that sounds you're more like a 5 than a 9, don't you think?"

"Um."

"Okay lets pivot to SQL. Can you define what window functions are, and what fixed level calculations are?"

"Um, I don't know how to define that for you right off the bat."

"Those are pretty basic SQL concepts. Ok. It says you also have here you have Python on your resume"

"Yes, that was school experience."

"I wouldn't put that on your work resume if you have no practical experience."

The two senior managers continued to ask her questions as well, and didn't stop to ask her for a break. What would you all do? Crying seems like a death sentence but at the same time, I did not like how the panel went about the whole thing. 
      """,
    "comments": {
      "Helen": "Wait, how is it a junior position with 3-5 years experience?",
      "Becca": "Go to HR about the interviewing.  Do you work for the STASI?  Was there a big, bright light to intimidate the candidate?  Do you work with a whole bunch of soulless assholes with no social skills?",}}];

  List resource_data = [
    {"name": "Top Tips for Technical Interviews from 9 of Instagram’s “Tech Girls”",
      "content": "The article showcases top tips for acing technical interviews from 9 'Tech Girls' at Instagram. These tips range from how to prepare for interviews, to what to do during the interview and how to follow-up afterwards. Each 'Tech Girl' gives insightful advice based on personal interview experiences, which can help aspiring professionals and fresh graduates to prepare better and build confidence in their skills and abilities. The tips include practicing coding every day, sharpening problem-solving skills, staying updated with current technology trends, and conducting post-mortem after each interview.",
      "links": "https://medium.com/free-code-camp/top-tips-for-technical-interviews-from-9-of-instagrams-tech-girls-9d1b576bc287"},
    {"name": "4 Essential Tips to Ace the Tech Job Interview",
      "content": "The article provides readers with four essential tips that could help them succeed in a tech job interview. The tips include: doing thorough research on the company beforehand, showing up on time, demonstrating technical skills and experience, and asking insightful questions that exhibit curiosity and interest in the job.",
      "links": "https://www.cio.com/article/227960/4-essential-tips-to-ace-the-tech-job-interview.html"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 70,
        backgroundColor: AppColor.primaryColor,
        title: Text(
          "SisTech Space",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
        automaticallyImplyLeading: false,
        elevation: 8,
        shadowColor: Colors.grey,
      ),
      body: Container(
          color: Colors.grey[800],
          padding: EdgeInsets.all(10.0),
          child: ListView(
              children: <Widget>[
                _Welcome(context),
                _HighlightPost(context),
                SizedBox(height: 10),
                Text("Latest community post", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
                _HighlightForum(context, post_data),
                SizedBox(height: 10),
                Text("Most popular resources", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
                _HighlightResources(context, "Interview", resource_data),
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

              currentIndex: 2,
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