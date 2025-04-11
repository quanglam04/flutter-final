import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/domain/entities/news.dart';
import 'package:flutter_clean_architecture/gen/assets.gen.dart';
import 'package:flutter_clean_architecture/presentation/router/router.dart';
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
      onTap: () {
        context.pushRoute(DetailRoute(id: newsItem.id));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              constraints: const BoxConstraints(maxHeight: 120),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Image.asset(
                      width: 96,
                      height: 96,
                      fit: BoxFit.cover,
                      newsItem.imageUrl,
                    ),
                  ),
                  const Gap(8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          newsItem.category,
                          style: textTheme?.textSmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          newsItem.title,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Gap(12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      newsItem.author,
                                      height: 20,
                                      width: 20,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Flexible(
                                    child: Text(
                                      newsItem.source,
                                      style: textTheme?.textXSmallLink
                                          ?.copyWith(
                                            color:
                                                colorSchema?.grayscaleBodyText,
                                          ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Assets.icons.clock.svg(width: 12, height: 12),
                                  const SizedBox(width: 4),
                                  Text(
                                    newsItem.timeAgo,
                                    style: textTheme?.textXSmall?.copyWith(
                                      color: colorSchema?.grayscaleBodyText,
                                    ),
                                  ),
                                ],
                              ),
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
            const Gap(16),
          ],
        ),
      ),
    );
  }
}
