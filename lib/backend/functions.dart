import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_api/components/searchbar.dart';

Future<List> fetchNews() async {
  // final response = http.get(Uri.parse(
  //     'https://newsapi.org/v2/top-headlines?country=in&category=technology&pageSize=100&apiKey=a02a0c32124f48268955856ac28ea8c0' +
  //         '&q='
  //         //SearchBar.searchcontroller.text
  //         ));

  Uri requesturl = Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=in&category=technology&pageSize=100&apiKey=a02a0c32124f48268955856ac28ea8c0' + '&q=' + SearchBar.searchcontroller.text);

  var response = await http.get(requesturl);

  Map result = jsonDecode(response.body);
  print('fetched');

  return result['articles'];
}


Future<List> fetchUsNews() async {
  // final response = http.get(Uri.parse(
  //     'https://newsapi.org/v2/top-headlines?country=in&category=technology&pageSize=100&apiKey=a02a0c32124f48268955856ac28ea8c0' +
  //         '&q='
  //         //SearchBar.searchcontroller.text
  //         ));

  Uri requesturl = Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=us&category=technology&pageSize=100&apiKey=a02a0c32124f48268955856ac28ea8c0' + '&q=' + SearchBar.searchcontroller.text);

  var response = await http.get(requesturl);

  Map result = jsonDecode(response.body);
  print('fetched');

  return result['articles'];
}

Future<List> fetchIndEntertainment() async {
  // final response = http.get(Uri.parse(
  //     'https://newsapi.org/v2/top-headlines?country=in&category=technology&pageSize=100&apiKey=a02a0c32124f48268955856ac28ea8c0' +
  //         '&q='
  //         //SearchBar.searchcontroller.text
  //         ));

  Uri requesturl = Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=in&category=entertainment&pageSize=100&apiKey=a02a0c32124f48268955856ac28ea8c0' + '&q=' + SearchBar.searchcontroller.text);

  var response = await http.get(requesturl);

  Map result = jsonDecode(response.body);
  print('fetched');

  return result['articles'];
}

Future<List> fetchUsEntertainment() async {
  // final response = http.get(Uri.parse(
  //     'https://newsapi.org/v2/top-headlines?country=in&category=technology&pageSize=100&apiKey=a02a0c32124f48268955856ac28ea8c0' +
  //         '&q='
  //         //SearchBar.searchcontroller.text
  //         ));

  Uri requesturl = Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=us&category=entertainment&pageSize=100&apiKey=a02a0c32124f48268955856ac28ea8c0' + '&q=' + SearchBar.searchcontroller.text);

  var response = await http.get(requesturl);

  Map result = jsonDecode(response.body);
  print('fetched');

  return result['articles'];
}
