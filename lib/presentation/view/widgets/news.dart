import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/domain/entities/news.dart';
import 'package:flutter_clean_architecture/gen/assets.gen.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';
import 'package:gap/gap.dart';

class News extends StatelessWidget {
  final NewsItem newsItem;
  const News({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.themeOwn().textTheme;
    final colorSchema = context.themeOwn().colorSchema;
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(right: 24, left: 24),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
              width: 380,
              height: 120,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Container(
                      child: Image.asset(
                        width: 96,
                        height: 96,
                        fit: BoxFit.fitHeight,
                        newsItem.imageUrl,
                      ),
                    ),
                  ),
                  const Gap(5),
                  Container(
                    width: 264,
                    height: 120,
                    child: Column(
                      children: [
                        Text(newsItem.category),
                        Text(newsItem.title),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ClipOval(
                                  child: Image.asset(
                                    newsItem.author,
                                    height: 20,
                                    width: 20,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Text(
                                  newsItem.source,
                                  style: textTheme?.textXSmallLink?.copyWith(
                                    color: colorSchema?.grayscaleBodyText,
                                  ),
                                ),
                                Assets.icons.clock.svg(),
                                Text(
                                  newsItem.timeAgo,
                                  style: textTheme?.textXSmall?.copyWith(
                                    color: colorSchema?.grayscaleBodyText,
                                  ),
                                ),
                              ],
                            ),
                            Assets.icons.threedot.svg(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
