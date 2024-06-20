import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/model/newsmodel.dart';

class Newsitemlist extends StatelessWidget {


  final NewsModel newsModel;
  const Newsitemlist({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [

          CachedNetworkImage(
            imageUrl: newsModel.urlToImage.toString(),
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
            //imageUrl: '',
          ),



        ],
      ),


    );
  }
}
