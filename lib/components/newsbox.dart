import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_api/utils/text.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsBox extends StatelessWidget {
  //const NewsBox({Key? key}) : super(key: key);
  final String imageurl, title, time, description, url;

  const NewsBox(
      {super.key,
      required this.imageurl,
      required this.title,
      required this.time,
      required this.description,
      required this.url});

  launchURL(String url) async {
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: () {
            launchURL(url);
          },
          child: Container(
            padding: EdgeInsets.all(10),
            color: Colors.white,
            width: w,
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: imageurl,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.yellow),
                  ),
                  placeholder: (context, url) =>
                      CircularProgressIndicator(color: Colors.pink),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      modifiedtext(color: Colors.black, size: 16, text: title),
                      SizedBox(height: 5),
                      modifiedtext(
                          color: Colors.blueGrey, size: 12, text: time),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Divider(
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
