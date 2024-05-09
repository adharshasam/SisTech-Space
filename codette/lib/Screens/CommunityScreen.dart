import 'package:SisTech_Space/AppColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'GroupChatScreen.dart';
import 'ResourcesScreen.dart';
import 'HomePage.dart';
import 'UserProfileScreen.dart';
import 'ViewPostScreen.dart';

enum CommunityFilters {All, Interview, Resume, Career_Guidance, Workplace_Advice}

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {

  Widget _FilterTags(BuildContext context, Set<CommunityFilters> filters)  {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(8),
      child: Wrap(
        spacing: 5.0,
        children: CommunityFilters.values.map((CommunityFilters communityTags) {
          return FilterChip(
            label: Text(communityTags.name),
            selected: filters.contains(communityTags),
            onSelected: (bool selected) {
              setState(() {
                if (selected) {
                  filters.add(communityTags);
                } else {
                  filters.remove(communityTags);
                }
              });
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _FilterChip(BuildContext context, String filter) {
    return Row(
      children: <Widget> [
        InkWell(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: AppColor.primaryColor,
            ),
            padding: EdgeInsets.fromLTRB(6.0, 1.0, 6.0, 1.0),
            child: Text(filter, style:TextStyle(fontSize: 10)),
          ),
          onTap: () {

          }
        ),
        const SizedBox(width: 5),
      ]
    );
  }

  Widget _Posts(BuildContext context, List data) {
    return Card(
      child: InkWell(
        onTap:() => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ViewPostScreen(postTag: data)),
        ),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.account_circle, size: 30.0),
              title: Text(data[0]["title"]),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data[0]["user"]),
                  Row(
                      children: <Widget>[
                        for (var item in data[0]["tags"]) _FilterChip(context, item)
                      ]
                  )
                ]
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
              alignment: Alignment.centerLeft,
              child: Text(data[0]["content"], maxLines: 2,)
            )
          ]
        ),
      )
    );
  }

  Set<CommunityFilters> filters = <CommunityFilters>{};

  // POST CONTENT
  List post_data = [
    [{"id": "1",
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
      "Becca": "Go to HR about the interviewing.  Do you work for the STASI?  Was there a big, bright light to intimidate the candidate?  Do you work with a whole bunch of soulless assholes with no social skills?",}}],
    [{"id": "2",
      "title": "Ladies, I'm hiring at Johnson & Johnson!",
      "user": "Pecckies",
      "tags": ["Resume"],
      "content": """As a leader driving Johnson & Johnson's network software and automation initiatives, I'm thrilled to announce that our team is expanding! Today, I'm excited to present two compelling opportunities, with another one on the horizon later this week. I hope these openings inspire more women to join the network automation field alongside me!

Roles:

1. Lead Network Automation Engineer (Europe-based) - Our preferred location is Antwerp, Belgium, but we welcome candidates who can work from JNJ locations in Switzerland, Italy, Spain, France, or Germany. Find out more about this role on our [LinkedIn Post](https://www.linkedin.com/jobs/view/3841952415)!
2. Senior Network Observability Engineer (US-based) - While Raritan, NJ is our preferred location, we're open to fully-remote candidates within the US who can accommodate an EST/EDT workday. Learn more about this opportunity on our [LinkedIn Post](https://www.linkedin.com/jobs/view/3842363729/)!

A unique note: Despite adhering to specific title structures for our open roles, I want to emphasize that titles shouldn't limit your aspirations. Our Lead Network Automation Engineer position is internally structured as a mid-level role, while our Senior-level roles are one step above lead roles with no direct reports.

About our team: We're a diverse and dynamic global group of 10 (and growing!)  network automation engineers. Together, we're dedicated to pioneering end-to-end automation solutions that drive innovation and efficiency across our global infrastructure and technology teams. Additionally, this year marks the beginning of an exciting journey into network observability, with a strong focus on AI capabilities. Our objectives include precision issue identification, strategic integrations for enhanced data availability, and laying the groundwork for accelerated self-healing mechanisms.

Feel free to explore the job links, and if you have any questions, don't hesitate to reach out below!

Update: If these roles do not fit but there is a position you're interested in that you could use support in getting noticed for, feel free to send me a DM and we can connect. The more women in tech at J&J, the better, and I would love to help in any way I can!
      """,
      "comments": {
      "Jane": "Not qualified for these roles but really appreciate you posting them here.",
      "Jaq": "salary range?"}}],
  [{"id": "3",
  "title": "Navigating tech as a shy woman",
  "user": "sherrycherry0909",
  "tags": ["Career_Guidance"],
  "content": """I (28F) recently started a data science internship at a cool startup and feel very inadequate compared to my peers. I'm the only intern (unpaid) so I understand I'm comparing myself to people in jobs but it's hard not to. Basically, I'm struggling with confidence.

I did a conversion masters course (they're a thing in the UK basically a one year intense course) in CS this year but prior to that I got a degree in sociology and interned in non profits and worked as a customer service agent at a bank. I also worked PT in restaurants all throughout college to pay for bills and whatnot. I'm first gen college graduate so navigating my career/studies has been with no guidance whatsoever other than my own personal trial and errors.

I love working in data science more than I ever did working any other job ever and really want to succeed in this career. But I feel like I'm not supposed to be there. Everybody else in the startup is very successful, having studied at top schools and worked at top companies prior to joining the company. There aren't any women in leadership and only two women in SWE or DS who I don't think really like me. Basically, how do I navigate working in this industry when I feel under qualified, insecure, and low key stupid. I'm also still learning the business-y terms and get quite lost when joining meetings.

Have any other women or first gen people experienced this? I want to succeed but it's really hard not to compare and get intimidated by everyone around me. I also feel like an inconvenience.
      """,
  "comments": {
  "Jesy": "Yep. Me. I went to therapy lol. Look at how respectfully you view your peers— you are their peer too. You belong. They chose YOU when they hired you to give you a shot, because you seem likely to succeed in their eyes. They know your background, and they picked you over several other people. You say you love working in data science— that’s pretty good insurance that you’ll do great. You got this.",
  "Jo": """I was in the exact same position, frankly maybe a little worse since I was still in undergrad, but I was 28, interning at a progressive superpac with like, 19 year olds who were so much more aware and savvy than I was it put me in a constant state of anxious inadequacy. 
  But what I realized, now that I'm another degree and 6 years of experience down the line, the things I hated about myself, which was essentially being old, having worked in restaurants my entire life, having bloodied my knuckles pounding down the doors in front of me to get into education, those all ended up being my assets."""}}],
  [{"id": "4",
  "title": "Being pushier as a young grad",
  "user": "yuanleebumblebee",
  "tags": ["Workplace_Advice"],
  "content": """Hello ladies! I have recently given notice for a software engineering graduate role that I have done 1.5/2 years in. I’ve left because I’ve had no mentorship, no training and support, and the role has just been a waste of my time.

The feedback I got was that I needed to be more pushy, I would ask to peer program but after a few times of people saying “sure” and it not coming to fruition, I’d get a bit awkward and stop asking. They’ve got work of their own to do. Im very extroverted, so it’s not that I’m hiding away at home. I’m in the office, waiting.

I can’t help but feel my male peers, who were hired at the same time as me haven’t had this issue. They all seemed to have had the support they needed.

My question is then, how do I be pushier? I feel annoying if I’m asking over and over with no one wanting to mentor me. Why don’t people respond to me? I know I’m not pushy because male friends have shared stories about them asking for raises etc and I always think gosh i wouldn’t even think to ask that!

Thanks in advance, struggling new grad.
      """,
  "comments": {
  "Jazz": "You have to learn how to drive stuff. If you ask someone for something and they say yes, then you go ahead and put the meeting on the calendar. Then after the meeting, you plan the follow up. Never wait. You take control of the process.",
  "Hilary": """I would literally invite myself to things I thought were relevant to me. Unless you're obviously out of place, usually nobody will say anything. I was very shy when I was younger so it was a weird feeling for me, but I made it a game to push myself into more and more situations until I became useful. 

  If I wanted to learn how a machine worked, I would hunt down the next time a job would start and chat up the machine operator. If I thought I could benefit from attending a meeting, I would find out where it was being held and show up (on time, before the door closes)."""}}],
  ];

  List existingPosts = [];
  int i = 0;

  List filteredPosts(Set<CommunityFilters> filters, List post_data) {
    existingPosts = [];
    for (var post in post_data) {
      for (var filter in filters) {
        if (filter.name == "All") {
          if (!existingPosts.contains(post[0]["id"])) {
            existingPosts.add(post[0]["id"]);
          }
        } else if (post[0]["tags"].contains(filter.name)) {
          if (!existingPosts.contains(post[0]["id"])) {
            existingPosts.add(post[0]["id"]);
          }
        }
      }
    }
    return existingPosts;
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
            // tag filters
            _FilterTags(context, filters),
            // posts
            Expanded(
              child: ListView(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 5.0),
                  children: <Widget> [
                    for(var index in filteredPosts(filters, post_data))...[
                      for(var post in post_data)...[
                        if (index == post[0]["id"])...[
                          _Posts(context, post)
                        ]
                      ]
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