import 'package:SisTech_Space/AppColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'GroupChatScreen.dart';
import 'HomePage.dart';
import 'UserProfileScreen.dart';
import 'CommunityScreen.dart';
import 'ResourcesListScreen.dart';
import 'IndividualResourceScreen.dart';

class ResourcesScreen extends StatefulWidget {
  const ResourcesScreen({super.key});

  @override
  State<ResourcesScreen> createState() => _ResourcesScreenState();
}

class _ResourcesScreenState extends State<ResourcesScreen> {

  Widget _ResourceRow(BuildContext context, String resource, List information) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(resource, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
            trailing: TextButton(
              child: Text("View All", style: TextStyle(decoration: TextDecoration.underline, color: Colors.white)),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ResourcesListScreen(resourceName: resource, resourceInfo: information))),
            )
          ),
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                InkWell(
                    child: Container(
                        padding: EdgeInsets.all(8),
                        constraints: BoxConstraints(maxWidth: 200),
                        decoration: BoxDecoration(
                          color: Color(0xFFFEE1DF),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(information[0]["name"], style: TextStyle(fontSize: 15)),
                          ]
                        )
                    ),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => IndividualResourceScreen(resourceName: resource, resourceInfo: information[0])))
                ),
                const SizedBox(width: 5),
                InkWell(
                    child: Container(
                        padding: EdgeInsets.all(8),
                        constraints: BoxConstraints(maxWidth: 200),
                        decoration: BoxDecoration(
                          color: Color(0xFFFEE1DF),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(information[1]["name"], style: TextStyle(fontSize: 15)),
                            ]
                        )
                    ),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => IndividualResourceScreen(resourceName: resource, resourceInfo: information[1]))),
                ),
              ]
            )
          )
        ]
      )
    );
  }

  List interview_info = [
    {"name": "Top Tips for Technical Interviews from 9 of Instagram’s “Tech Girls”",
      "content": "The article showcases top tips for acing technical interviews from 9 'Tech Girls' at Instagram. These tips range from how to prepare for interviews, to what to do during the interview and how to follow-up afterwards. Each 'Tech Girl' gives insightful advice based on personal interview experiences, which can help aspiring professionals and fresh graduates to prepare better and build confidence in their skills and abilities. The tips include practicing coding every day, sharpening problem-solving skills, staying updated with current technology trends, and conducting post-mortem after each interview.",
      "links": "https://medium.com/free-code-camp/top-tips-for-technical-interviews-from-9-of-instagrams-tech-girls-9d1b576bc287"},
    {"name": "4 Essential Tips to Ace the Tech Job Interview",
      "content": "The article provides readers with four essential tips that could help them succeed in a tech job interview. The tips include: doing thorough research on the company beforehand, showing up on time, demonstrating technical skills and experience, and asking insightful questions that exhibit curiosity and interest in the job.",
      "links": "https://www.cio.com/article/227960/4-essential-tips-to-ace-the-tech-job-interview.html"}
  ];

  List portfolio_info = [
    {"name": "5 awesome freewebsites to host your data science portfolio for free",
      "content": "This page contains an article written by Women in Technology published in November 2021. The article talks about five free websites where one can host their data science portfolio. The author explains the importance of having a professional data science portfolio and the benefits of showcasing it on a platform. The five platforms discussed include GitHub, Kaggle, Google Colab, Blogger, and WordPress. The author explains each platform, including its features, benefits, and how to make the most of each. ",
      "links": "https://medium.com/womenintechnology/5-awesome-freewebsites-to-host-your-data-science-portfolio-for-free-50bb1dcff447"},
    {"name": "How to Create Your Writing Portfolio with Women in Tech Publication ",
      "content": "The article is an instructional guide for individuals who wish to create a writing portfolio with Women in Tech. It provides a step-by-step guide on how to navigate through the Medium platform, giving detailed instructions on how to become a writer for the Women in Tech publication. ",
      "links": "https://medium.com/womenintechnology/how-to-create-your-writing-portfolio-with-women-in-tech-publication-aa33ffdf83aa"}
  ];

  List resume_info = [
    {"name": "8 Tips for Writing Your First Graduate CV in Tech - Women in Tech",
      "content": "The webpage provides eight essential tips for writing the first graduate CV in the tech industry. These tips focus on identifying your abilities, showcasing relevant experience and skills, understanding the job description, and more. The aim of this content is to aid fresh graduates to create a compelling CV that would seem attractive to recruiting tech firms.",
      "links": "https://www.womenintech.co.uk/8-tips-for-writing-your-first-graduate-cv-in-tech/"},
    {"name": "#GWCtalks: How to Craft the Perfect Tech Resume",
      "content": "This article is a guide for crafting the perfect tech resume. It is written by Girls Who Code, a non-profit organization aimed at closing the gender gap in technology. The article gives valuable advice on tailoring tech resumes, with the consideration of skill highlighting, listing experience, and writing a compelling introduction. It also emphasizes on showcasing technical skills, soft skills and extracurricular activities.",
      "links": "https://girlswhocode.medium.com/gwctalks-how-to-craft-the-perfect-tech-resume-988a3d64981c"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        title: Text(
            "Resources",
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
                OutlinedButton(
                  child: Text("Try out our LLM!", style: TextStyle(fontSize: 20)),
                  style: OutlinedButton.styleFrom(backgroundColor: AppColor.primaryColor, foregroundColor: Colors.black),
                  onPressed: (){},
                ),
                _ResourceRow(context, "Interview", interview_info),
                _ResourceRow(context, "Portfolio", portfolio_info),
                _ResourceRow(context, "Resumes", resume_info)
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