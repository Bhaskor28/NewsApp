import 'package:flutter/material.dart';
import 'package:newsapp/component/newsitemlist.dart';
import 'package:newsapp/model/newsmodel.dart';
import '../service/apiservice.dart';

class Breakingnews extends StatefulWidget {
  const Breakingnews({super.key});

  @override
  State<Breakingnews> createState() => _BreakingnewsState();
}

class _BreakingnewsState extends State<Breakingnews> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breaking News'),
      ),
      body: FutureBuilder<List<NewsModel>>(
        future: apiService.getBreakingnews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            List<NewsModel> articlesList = snapshot.data ?? [];

            if (articlesList.isEmpty) {
              return const Center(
                child: Text('No breaking news available.'),
              );
            }

            return ListView.builder(
              itemCount: articlesList.length,
              itemBuilder: (context, index) {
                return Newsitemlist(newsModel: articlesList[index]);
              },
            );
          } else {
            return const Center(
              child: Text('No data available.'),
            );
          }
        },
      ),
    );
  }
}
