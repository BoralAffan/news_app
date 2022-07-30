import 'package:flutter/material.dart';
import 'package:news_api/backend/functions.dart';
import 'package:news_api/components/searchbar.dart';
import 'package:news_api/components/searchbar2.dart';
import 'package:news_api/utils/constant.dart';
import 'package:news_api/utils/text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List> news;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    news = fetchNews();
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
      ),
      body: Column(
        children: [
          SearchBar2(),
          Expanded(
              child: Container(
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder<List>(
              future: fetchNews(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Container();
                      });
                } else
                  return Container();
              },
            ),
          ))
        ],
      ),
    );
  }
}
