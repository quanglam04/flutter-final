import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/domain/entities/author.dart';
import 'package:flutter_clean_architecture/gen/assets.gen.dart';
import 'package:flutter_clean_architecture/presentation/view/pages/search/search_bloc.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';
import 'package:gap/gap.dart';

class ListAuthor extends StatefulWidget {
  final List<Author> listAuthor;
  ListAuthor({super.key, required this.listAuthor});

  @override
  State<ListAuthor> createState() => _ListAuthorState();
}

class _ListAuthorState extends State<ListAuthor> {
  @override
  Widget build(BuildContext context) {
    final textTheme = context.themeOwn().textTheme;
    final colorSchema = context.themeOwn().colorSchema;
    return ListView.builder(
      padding: EdgeInsets.only(right: 24, left: 24),
      itemCount: widget.listAuthor.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4.5),
              height: 86,
              child: Row(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape:
                          BoxShape
                              .circle, // Thay đổi từ borderRadius thành shape: BoxShape.circle
                      color: Colors.red, // Thêm màu nền đỏ giống logo BBC
                      image: DecorationImage(
                        image: NetworkImage(widget.listAuthor[index].imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Gap(8),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          softWrap: true,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          widget.listAuthor[index].brandName,
                          style: textTheme?.textMedium?.copyWith(
                            color: colorSchema?.darkBlack,
                          ),
                        ),
                        Gap(4),
                        Text(
                          softWrap: true,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          '${formatNumber(widget.listAuthor[index].followers)} Followers',
                          style: textTheme?.textMedium?.copyWith(
                            color: colorSchema?.darkBlack,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(8),
                  BlocBuilder<SearchBloc, SearchState>(
                    buildWhen: (preStatus, currentStatus) {
                      return preStatus.followAuthor !=
                          currentStatus.followAuthor;
                    },
                    builder: (context, state) {
                      return InkWell(
                        child:
                            widget.listAuthor[index].isFollow
                                ? Assets.icons.following.svg()
                                : Assets.icons.follow.svg(),
                        onTap: () {
                          context.read<SearchBloc>().add(
                            SearchEvent.changeFollowAuthor(
                              widget.listAuthor[index].brandName,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            const Gap(16),
          ],
        );
      },
    );
  }
}

String formatNumber(int number) {
  if (number >= 1000000) {
    return '${(number / 1000000).toStringAsFixed(1)}M';
  } else if (number >= 1000) {
    return '${(number / 1000).toStringAsFixed(1)}K';
  } else {
    return number.toString();
  }
}
