import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:news_api/backend/functions.dart';

class SearchBar2 extends StatefulWidget {
  const SearchBar2({Key? key}) : super(key: key);

  @override
  State<SearchBar2> createState() => _SearchBar2State();
}

class _SearchBar2State extends State<SearchBar2> {
  TextEditingController searchcontroller = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          height: 80,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  height: 55,
                  width: 330,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 111, 111),
                      borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    controller: searchcontroller,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search a keyword or a phrase ',
                        hintStyle: TextStyle(fontSize: 14)),
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              InkWell(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  fetchNews();
                },
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.redAccent),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ),
              
            ],
          ),
        )
      ],
    );
  }
}
