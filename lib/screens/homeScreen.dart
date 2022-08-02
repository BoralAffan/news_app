import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_api/backend/functions.dart';
import 'package:news_api/components/newsbox.dart';
import 'package:news_api/components/searchbar.dart';
import 'package:news_api/components/searchbar2.dart';
import 'package:news_api/news_widgets/ind_ent.dart';
import 'package:news_api/news_widgets/ind_news.dart';
import 'package:news_api/news_widgets/us_ent.dart';
import 'package:news_api/news_widgets/us_news.dart';
import 'package:news_api/utils/constant.dart';
import 'package:news_api/utils/text.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late Future<List> news;

  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    news = fetchNews();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Tech',
                style: TextStyle(
                  color: Colors.red,
                )),
            Text('News', style: TextStyle(color: Colors.black))
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pop(context);
            },
            child: Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        children: [
          SearchBar2(),
          SizedBox(
            height: 15,
          ),
          TabBar(
            controller: tabController,
            tabs: [
              Tab(
                child: Text(
                  "tech news in India",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                  child: Text(
                "tech news in Us",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              )),
              Tab(
                  child: Text(
                "Top Entertainment in India",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              )),
              Tab(
                  child: Text(
                "Top Entertainment in Us",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              )),
            ],
          ),
          Expanded(
              child: TabBarView(
                  controller: tabController,
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  children: [
                IndNews(),
                UsNews(),
                IndEntertainment(),
                UsEntertinment()
              ]))
        ],
      ),
    );
  }
}
