import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/gen/assets.gen.dart';
import 'package:flutter_clean_architecture/presentation/router/router.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/app_button.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/list_news.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';
import 'package:gap/gap.dart';
import '../../../base/base_page.dart';
import 'profile_bloc.dart';

@RoutePage()
class ProfilePage extends BasePage<ProfileBloc, ProfileEvent, ProfileState> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  void onInitState(BuildContext context) {
    context.read<ProfileBloc>().add(const ProfileEvent.loadData());
    super.onInitState(context);
  }

  @override
  Widget builder(BuildContext context) {
    final textTheme = context.themeOwn().textTheme;
    final colorSchema = context.themeOwn().colorSchema;
    final iconColor = Theme.of(context).iconTheme.color;
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            shadowColor: Colors.transparent,
            title: Text(
              'Profile',
              style: textTheme?.textMedium?.copyWith(
                color: colorSchema?.darkBlack,
              ),
            ),
            actions: [
              InkWell(
                onTap: () {
                  context.pushRoute(SettingRoute());
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Assets.icons.settingIcon.svg(color: iconColor),
                ),
              ),
            ],
          ),
          body: NestedScrollView(
            headerSliverBuilder:
                (context, innerBoxIsScrolled) => [
                  SliverToBoxAdapter(
                    child: BlocBuilder<ProfileBloc, ProfileState>(
                      buildWhen: (preState, state) {
                        return preState.currentUser != state.currentUser;
                      },
                      builder: (context, state) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: ClipOval(
                                      child: Image.network(
                                        'https://avatars.githubusercontent.com/u/119520066?v=4',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const Gap(24),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              '2156',
                                              style: textTheme?.textMediumLink
                                                  ?.copyWith(
                                                    color:
                                                        colorSchema?.darkBlack,
                                                  ),
                                            ),
                                            Text(
                                              'Followers',
                                              style: textTheme?.textMedium
                                                  ?.copyWith(
                                                    color:
                                                        colorSchema
                                                            ?.grayscaleBodyText,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              '567',
                                              style: textTheme?.textMediumLink
                                                  ?.copyWith(
                                                    color:
                                                        colorSchema?.darkBlack,
                                                  ),
                                            ),
                                            Text(
                                              'Following',
                                              style: textTheme?.textMedium
                                                  ?.copyWith(
                                                    color:
                                                        colorSchema
                                                            ?.grayscaleBodyText,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              state.listNews?.length
                                                      .toString() ??
                                                  '0',
                                              style: textTheme?.textMediumLink
                                                  ?.copyWith(
                                                    color:
                                                        colorSchema?.darkBlack,
                                                  ),
                                            ),
                                            Text(
                                              'News',
                                              style: textTheme?.textMedium
                                                  ?.copyWith(
                                                    color:
                                                        colorSchema
                                                            ?.grayscaleBodyText,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Gap(16),
                              Text(
                                state.currentUser?.username ??
                                    'Trịnh Quang Lâm',
                                style: textTheme?.textMediumLink?.copyWith(
                                  color: colorSchema?.darkBlack,
                                ),
                              ),
                              Text(
                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                                style: textTheme?.textMedium?.copyWith(
                                  color: colorSchema?.grayscaleBodyText,
                                ),
                              ),
                              const Gap(16),
                              Row(
                                children: [
                                  Expanded(
                                    child: AppButton.primary(
                                      title: 'Edit Profile',
                                      onPressed: () {
                                        context.pushRoute(
                                          const EditProfileRoute(),
                                        );
                                      },
                                      height: 50,
                                      backgroundColor:
                                          colorSchema?.primaryDefault,
                                    ),
                                  ),
                                  const Gap(16),
                                  Expanded(
                                    child: AppButton.primary(
                                      title: 'Website',
                                      onPressed: () {},
                                      height: 50,
                                      backgroundColor:
                                          colorSchema?.primaryDefault,
                                    ),
                                  ),
                                ],
                              ),
                              const Gap(5),
                              Center(
                                child: TabBar(
                                  padding: const EdgeInsets.only(left: 24),
                                  labelPadding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                  indicatorSize: TabBarIndicatorSize.label,
                                  isScrollable: true,
                                  indicatorColor: colorSchema?.primaryDefault,
                                  labelStyle: textTheme?.textMedium,
                                  labelColor: colorSchema?.darkBlack,
                                  unselectedLabelStyle: textTheme?.textMedium
                                      ?.copyWith(
                                        color: colorSchema?.grayscaleBodyText,
                                      ),
                                  tabs: const [Text('News'), Text('Recent')],
                                ),
                              ),
                              const Gap(13),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
            body: BlocBuilder<ProfileBloc, ProfileState>(
              buildWhen: (preState, state) {
                return preState.listNews != state.listNews;
              },
              builder: (context, state) {
                return TabBarView(
                  children: [
                    ListNewsItem(listNewsItem: state.listNews ?? []),
                    ListNewsItem(listNewsItem: state.listNewsRecent ?? []),
                  ],
                );
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Assets.icons.add.svg(),
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
