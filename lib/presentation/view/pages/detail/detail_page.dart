import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/gen/assets.gen.dart';
import 'package:flutter_clean_architecture/presentation/router/router.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';
import 'package:gap/gap.dart';

import '../../../base/base_page.dart';
import 'detail_bloc.dart';

@RoutePage()
class DetailPage extends BasePage<DetailBloc, DetailEvent, DetailState> {
  const DetailPage({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  void onInitState(BuildContext context) {
    final id = context.routeData.argsAs<DetailRouteArgs>().id;
    context.read<DetailBloc>().add(DetailEvent.loadData(id));
    super.onInitState(context);
  }

  @override
  Widget builder(BuildContext context) {
    final textTheme = context.themeOwn().textTheme;
    final colorSchema = context.themeOwn().colorSchema;
    final iconColor = Theme.of(context).iconTheme.color;
    return BlocBuilder<DetailBloc, DetailState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            shadowColor: Colors.transparent,
            leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Assets.icons.backIcon.svg(color: iconColor),
            ),
            actions: [
              IconButton(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: Assets.icons.share.svg(color: iconColor),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: PopupMenuButton<String>(
                  padding: EdgeInsets.zero,
                  icon: Assets.icons.threeDot2.svg(color: iconColor),
                  onSelected: (value) => {},
                  itemBuilder:
                      (context) => [
                        PopupMenuItem(
                          child: const Text('Setting'),
                          value: 'Setting',
                          onTap: () {
                            context.pushRoute(SettingRoute());
                          },
                        ),
                      ],
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ClipOval(
                          child: Image.asset(
                            state.newsDetail?.author ??
                                'assets/images/author.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Gap(2.5),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.newsDetail?.source ?? 'BBC News',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: textTheme?.textMediumLink?.copyWith(
                                color: colorSchema?.darkBlack,
                              ),
                            ),
                            Text(
                              state.newsDetail?.timeAgo ?? '14m ago',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: textTheme?.textSmall?.copyWith(
                                color: colorSchema?.grayscaleBodyText,
                              ),
                            ),
                          ],
                        ),
                      ),

                      InkWell(
                        onTap: () {},
                        child: Assets.icons.following.svg(),
                      ),
                    ],
                  ),
                  const Gap(16),
                  Container(
                    height: 248,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      image: DecorationImage(
                        image: AssetImage(
                          state.newsDetail?.imageUrl ??
                              'assets/images/giaoduc.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Gap(16),
                  Text(
                    state.newsDetail?.category ?? 'Europe',
                    style: textTheme?.textSmall?.copyWith(
                      color: colorSchema?.grayscaleBodyText,
                    ),
                  ),
                  const Gap(4),
                  Text(
                    state.newsDetail?.title ?? '',
                    style: textTheme?.textDisplaySmall?.copyWith(
                      color: colorSchema?.darkBlack,
                    ),
                  ),
                  const Gap(16),
                  Text(
                    state.newsDetail?.description ?? 'Description',
                    style: textTheme?.textMedium?.copyWith(
                      color: colorSchema?.grayscaleBodyText,
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            height: 78,
            decoration: BoxDecoration(
              color: colorSchema?.background,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),

            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    context.read<DetailBloc>().add(DetailEvent.changeTym());
                  },
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minWidth: 43),
                    child: Assets.icons.tym.svg(
                      color:
                          state.saveState
                              ? Colors.red
                              : colorSchema?.grayscaleBodyText,
                    ),
                  ),
                ),
                const Gap(4),
                Expanded(
                  flex: 0,
                  child: Text((state.numberOfTym ?? 34).toString()),
                ),
                const Gap(30),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      context.pushRoute(CommentRoute());
                    },
                    child: Row(
                      children: [
                        Assets.icons.comment.svg(),
                        const Gap(4),
                        Text(
                          '98',
                          style: textTheme?.textMedium?.copyWith(
                            color: colorSchema?.grayscaleTitleactive,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: SizedBox(
                    height: 70,
                    width: 70,
                    child: Assets.icons.saveDetailScreen.svg(
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
