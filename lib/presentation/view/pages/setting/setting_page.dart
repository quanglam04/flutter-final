import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/gen/assets.gen.dart';
import 'package:flutter_clean_architecture/presentation/router/router.dart';
import 'package:flutter_clean_architecture/presentation/theme/theme_bloc.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/app_switch.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';
import 'package:flutter_clean_architecture/shared/utils/logger.dart';
import 'package:gap/gap.dart';

import '../../../base/base_page.dart';
import 'setting_bloc.dart';

@RoutePage()
class SettingPage extends BasePage<SettingBloc, SettingEvent, SettingState> {
  const SettingPage({Key? key}) : super(key: key);

  @override
  void onInitState(BuildContext context) {
    context.read<SettingBloc>().add(const SettingEvent.loadData());
    super.onInitState(context);
  }

  @override
  Widget builder(BuildContext context) {
    final textTheme = context.themeOwn().textTheme;
    final colorSchema = context.themeOwn().colorSchema;
    final iconColor = Theme.of(context).iconTheme.color;
    logger.d(textTheme);
    logger.d(colorSchema);
    logger.d(iconColor);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.transparent,
        leading: IconButton(
          padding: EdgeInsets.only(left: 16),
          onPressed: context.pop,
          icon: Assets.icons.backIcon.svg(color: iconColor),
        ),
        title: Text(
          'Setting',
          style: textTheme?.textMedium?.copyWith(color: colorSchema?.darkBlack),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Row(
                children: [
                  Assets.icons.settingIcon1.svg(color: colorSchema?.iconWhite),
                  const Gap(4),
                  Text(
                    'Notification',
                    style: textTheme?.textMedium?.copyWith(
                      color: colorSchema?.darkBlack,
                    ),
                  ),
                  const Spacer(),
                  Assets.icons.settingIcon31.svg(color: colorSchema?.iconWhite),
                ],
              ),
              const Gap(48),
              Row(
                children: [
                  Assets.icons.settingIcon2.svg(color: colorSchema?.iconWhite),
                  const Gap(4),
                  Text(
                    'Security',
                    style: textTheme?.textMedium?.copyWith(
                      color: colorSchema?.darkBlack,
                    ),
                  ),
                  const Spacer(),
                  Assets.icons.settingIcon31.svg(color: colorSchema?.iconWhite),
                ],
              ),
              const Gap(48),
              Row(
                children: [
                  Assets.icons.settingIcon3.svg(color: colorSchema?.iconWhite),
                  const Gap(4),
                  Text(
                    'Help',
                    style: textTheme?.textMedium?.copyWith(
                      color: colorSchema?.darkBlack,
                    ),
                  ),
                  Spacer(),
                  Assets.icons.settingIcon31.svg(color: colorSchema?.iconWhite),
                ],
              ),
              const Gap(48),
              Row(
                children: [
                  Assets.icons.settingIcon4.svg(color: colorSchema?.iconWhite),
                  const Gap(4),
                  Text(
                    'Dark Mode',
                    style: textTheme?.textMedium?.copyWith(
                      color: colorSchema?.darkBlack,
                    ),
                  ),
                  const Spacer(),
                  BlocBuilder<SettingBloc, SettingState>(
                    builder: (context, state) {
                      return SizedBox(
                        width: 36,
                        child: AppCupertinoSwitch(
                          value: state.darkMode,
                          onChanged: (value) {
                            context.read<SettingBloc>().add(
                              const SettingEvent.changeDarkMode(),
                            );
                            context.read<ThemeBloc>().add(
                              ThemeEvent.changeThemeMode(value),
                            );
                          },
                          activeTrackColor: const Color(0xff667080),
                          inactiveTrackColor: colorSchema?.grayscaleButtonText,
                          thumbColor: CupertinoColors.white,
                        ),
                      );
                    },
                  ),
                ],
              ),
              const Gap(48),
              Row(
                children: [
                  Assets.icons.settingIcon5.svg(),
                  const Gap(4),
                  InkWell(
                    child: Text(
                      'Logout',
                      style: textTheme?.textMedium?.copyWith(
                        color: colorSchema?.darkBlack,
                      ),
                    ),
                    onTap:
                        () => context.router.replaceAll([const LoginRoute()]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
