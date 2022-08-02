import 'package:flutter/material.dart';
import 'package:news_api/components/newsbox.dart';
import 'package:news_api/utils/constant.dart';

import '../backend/functions.dart';

class IndNews extends StatelessWidget {
  const IndNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder<List>(
        future: fetchNews(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return NewsBox(
                    url: snapshot.data![index]['url'],
                    imageurl: snapshot.data![index]['urlToImage'] != null
                        ? snapshot.data![index]['urlToImage']
                        : constant.imageurl,
                    title: snapshot.data![index]['title'],
                    time: snapshot.data![index]['publishedAt'],
                    description:
                        snapshot.data![index]['description'].toString(),
                  );
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return Center(
              child: CircularProgressIndicator(
            color: Colors.redAccent,
          ));
        },
      ),
    ));
  }
}
