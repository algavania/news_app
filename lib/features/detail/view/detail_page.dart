import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/styles.dart';
import 'package:news_app/data/models/news/news_model.dart';

@RoutePage()
class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.news});
  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(news.title),),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(imageUrl: news.urlToImage, width: double.infinity, fit: BoxFit.cover,),
            Padding(
              padding: const EdgeInsets.all(Styles.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(news.title, style: Theme.of(context).textTheme.titleLarge,),
                  const SizedBox(height: Styles.defaultSpacing,),
                  Text(news.content),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
