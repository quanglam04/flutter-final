import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Notification;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/domain/entities/notification.dart';
import 'package:flutter_clean_architecture/gen/assets.gen.dart';
import 'package:flutter_clean_architecture/presentation/router/router.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';
import 'package:flutter_clean_architecture/shared/extension/datetime.dart';
import 'package:gap/gap.dart';

import '../../../base/base_page.dart';
import 'notification_bloc.dart';

@RoutePage()
class NotificationPage
    extends BasePage<NotificationBloc, NotificationEvent, NotificationState> {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  void onInitState(BuildContext context) {
    context.read<NotificationBloc>().add(const NotificationEvent.loadData());
    super.onInitState(context);
  }

  @override
  Widget builder(BuildContext context) {
    final textTheme = context.themeOwn().textTheme;
    final colorSchema = context.themeOwn().colorSchema;

    return BlocBuilder<NotificationBloc, NotificationState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            shadowColor: Colors.transparent,
            leading: IconButton(
              onPressed: context.pop,
              icon: Assets.icons.backIcon.svg(),
            ),
            title: Text(
              'Notification',
              style: textTheme?.textMediumLink?.copyWith(
                color: colorSchema?.darkBlack,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: PopupMenuButton<String>(
                  icon: Assets.icons.threeDot2.svg(),
                  onSelected: (x) {},
                  itemBuilder:
                      (context) => [
                        PopupMenuItem(value: 'Setting', child: Text('Setting')),
                        PopupMenuItem(
                          value: 'Logout',
                          child: Text('Logout'),
                          onTap:
                              () => context.router.replaceAll([LoginRoute()]),
                        ),
                      ],
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 16,
              right: 12,
              left: 12,
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.listNotificatioFollowDay?.length,
                    itemBuilder: (context, index) {
                      final entry = state.listNotificatioFollowDay?.entries
                          .elementAt(index);
                      final List<Notification> subList = entry!.value;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              subList[0].displayCreateAt(),
                              style: textTheme?.textMediumLink?.copyWith(
                                color: colorSchema?.darkBlack,
                              ),
                            ),
                            const Gap(10),
                            Column(
                              children:
                                  subList.map((notification) {
                                    return BlocBuilder<
                                      NotificationBloc,
                                      NotificationState
                                    >(
                                      builder: (context, state) {
                                        return Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: InkWell(
                                                onTap: () {
                                                  context
                                                      .read<NotificationBloc>()
                                                      .add(
                                                        NotificationEvent.markAsRead(
                                                          notification
                                                              .notificationId,
                                                        ),
                                                      );
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 99,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        notification.isRead ==
                                                                false
                                                            ? colorSchema
                                                                ?.grayscaleSecondaryButton
                                                            : colorSchema
                                                                ?.grayscaleWhite,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                          vertical: 14,
                                                          horizontal: 8,
                                                        ),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 70,
                                                          height: 70,
                                                          child: ClipOval(
                                                            child: Image.network(
                                                              notification
                                                                  .imgPath,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        const Gap(16),
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text.rich(
                                                                maxLines: 2,
                                                                softWrap: true,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text:
                                                                          notification
                                                                              .author
                                                                              .brandName,
                                                                      style: textTheme
                                                                          ?.textMediumLink
                                                                          ?.copyWith(
                                                                            color:
                                                                                colorSchema?.grayscaleTitleactive,
                                                                          ),
                                                                    ),
                                                                    const TextSpan(
                                                                      text: ' ',
                                                                    ),
                                                                    TextSpan(
                                                                      text:
                                                                          notification
                                                                              .content,
                                                                      style: textTheme
                                                                          ?.textMedium
                                                                          ?.copyWith(
                                                                            color:
                                                                                colorSchema?.grayscaleTitleactive,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Text(
                                                                notification
                                                                    .createAt
                                                                    .getDayAgo(),
                                                                style: textTheme
                                                                    ?.textXSmall
                                                                    ?.copyWith(
                                                                      color:
                                                                          colorSchema
                                                                              ?.grayscaleBodyText,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        if (notification.type ==
                                                            'follow')
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets.only(
                                                                  left: 16,
                                                                ),
                                                            child: InkWell(
                                                              onTap: () {
                                                                context
                                                                    .read<
                                                                      NotificationBloc
                                                                    >()
                                                                    .add(
                                                                      NotificationEvent.changeFollowed(
                                                                        notification
                                                                            .author
                                                                            .authorId,
                                                                      ),
                                                                    );
                                                              },
                                                              child:
                                                                  notification
                                                                          .author
                                                                          .isFollow
                                                                      ? Assets
                                                                          .icons
                                                                          .following
                                                                          .svg()
                                                                      : Assets
                                                                          .icons
                                                                          .follow
                                                                          .svg(),
                                                            ),
                                                          )
                                                        else
                                                          const SizedBox.shrink(),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const Gap(
                                              16,
                                            ), // Giảm Gap từ 16 xuống 8
                                          ],
                                        );
                                      },
                                    );
                                  }).toList(),
                            ),
                            // Khoảng cách giữa các nhóm ngày
                          ],
                        ),
                      );
                    },
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
