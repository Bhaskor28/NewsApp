
import 'package:flutter/material.dart';
import 'package:newsapp/ui/allnews.dart';
import 'package:newsapp/ui/breakingnews.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Scaffold(

      appBar: AppBar(

        title: Text("Flutter News APP"),
        centerTitle: true,
        bottom: TabBar(
          tabs: [
          Tab(text: "Breaking News"),
          Tab(text: "ALL  News"),

        ]
        ),

      ),

      body: TabBarView(
        children: [
          Breakingnews(),
          AllNews(),

        ],

      ),



    ));
  }
}
