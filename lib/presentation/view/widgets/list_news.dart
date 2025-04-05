import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/domain/entities/news.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/news.dart';

class ListNewsItem extends StatelessWidget {
  final List<NewsItem> listNewsItem;
  const ListNewsItem({super.key, required this.listNewsItem});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listNewsItem.length,
      itemBuilder: (context, index) {
        return News(newsItem: listNewsItem[index]);
      },
    );
  }
}
