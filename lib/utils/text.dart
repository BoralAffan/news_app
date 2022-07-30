import 'package:flutter/material.dart';
import 'package:news_api/utils/key.dart';

class modifiedtext extends StatelessWidget {
  final String text;
  final double size;
  final Color color;

  const modifiedtext(
      {super.key, required this.text, required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size),
    );
  }
}

class boldtext extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const boldtext({Key? key,required this.text,required this.color, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(color: color,fontSize: size,fontWeight: FontWeight.bold),);
  }
}
