import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:newsapp/model/newsmodel.dart';

class ApiService {

  final allnews =
      "https://newsapi.org/v2/everything?q=bitcoin&apiKey=717c76a9547946bab9b6f1ec2e675e1d";

  final breakingnews =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=717c76a9547946bab9b6f1ec2e675e1d";

  Future<List<NewsModel>> getAllnews() async {
    try {
      Response response = await get(Uri.parse(allnews));

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic>body = json['articles'];

        List<NewsModel>articleslist =
        body.map((item) => NewsModel.fromJson(item)).toList();
        return articleslist;
      }
      else {
        throw ("No news found");
      }
    }
    catch (e) {
      throw e;
    }
  }


// for getting breaking news


  Future<List<NewsModel>> getBreakingnews() async {
    try {
      Response response = await get(Uri.parse(breakingnews));

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic>body = json['articles'];

        List<NewsModel>articleslist =
        body.map((item) => NewsModel.fromJson(item)).toList();
        return articleslist;
      }
      else {
        throw ("No news found");
      }
    }
    catch (e) {
      throw e;
    }
  }

}



