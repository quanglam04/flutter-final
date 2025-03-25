import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/gen/assets.gen.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/app_button.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/app_form_field.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';
import 'package:flutter_svg/svg.dart';

import '../../../base/base_page.dart';
import 'login_bloc.dart';

@RoutePage()
class LoginPage extends BasePage<LoginBloc, LoginEvent, LoginState> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  void onInitState(BuildContext context) {
    context.read<LoginBloc>().add(const LoginEvent.loadData());
    super.onInitState(context);
  }

  @override
  Widget builder(BuildContext context) {
    final textTheme = context.themeOwn().textTheme;
    final colorSchema = context.themeOwn().colorSchema;

    return Padding(
      padding: const EdgeInsets.only(top: 44, left: 24, right: 24, bottom: 8),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'HELLO',
              style: textTheme?.textDisplayLargeBold?.copyWith(
                color: colorSchema?.grayscaleTitleactive,
              ),
            ),
            Text(
              'AGAIN',
              style: textTheme?.textDisplayLargeBold?.copyWith(
                color: colorSchema?.primaryDefault,
              ),
            ),
            Text(
              'Welcome back you’ve \nbeen missed',
              style: textTheme?.textLarge?.copyWith(
                color: colorSchema?.grayscaleBodyText,
              ),
            ),
            const SizedBox(height: 52),
            Row(
              children: [
                Text(
                  'Username',
                  style: textTheme?.textSmall?.copyWith(
                    color: colorSchema?.grayscaleBodyText,
                  ),
                ),
                Text(
                  '*',
                  style: textTheme?.textSmall?.copyWith(
                    color: colorSchema?.errorDark,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            AppFormField(

            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  'Password',
                  style: textTheme?.textSmall?.copyWith(
                    color: colorSchema?.grayscaleBodyText,
                  ),
                ),
                Text(
                  '*',
                  style: textTheme?.textSmall?.copyWith(
                    color: colorSchema?.errorDark,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            const AppFormField(),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Checkbox(
                        value: true,
                        activeColor: colorSchema?.primaryDefault,
                        onChanged: (x) {},
                      ),
                    ),
                    const SizedBox(width: 1.5),
                    Text(
                      'Remember me',
                      style: textTheme?.textSmall?.copyWith(
                        color: colorSchema?.grayscaleBodyText,
                      ),
                    ),
                  ],
                ),
                const Text(
                  'Forgot the password ?',
                  style: TextStyle(
                    fontSize: 14,
                    height: 21 / 14,
                    color: Color(0xFF5890FF),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            AppButton.primary(
              height: 50,
              backgroundColor: colorSchema?.primaryDefault,
              title: 'Login',
              titleStyle: textTheme?.textMedium,
              onPressed: () {},
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child: Text(
                'or continue with',
                style: textTheme?.textSmall?.copyWith(
                  color: colorSchema?.grayscaleBodyText,
                ),
              ),
            ),
            SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AppButton.primary(
                    height: 48,
                    backgroundColor: colorSchema?.grayscaleSecondaryButton,
                    title: 'Facebook',
                    titleStyle: textTheme?.textMediumLink?.copyWith(
                      color: colorSchema?.grayscaleBodyText,
                    ),
                    onPressed: () {},
                    icon: Assets.icons.facebook.svg(),
                  ),
                ),
                const SizedBox(width: 31),
                Expanded(
                  child: AppButton.primary(
                    backgroundColor: colorSchema?.grayscaleSecondaryButton,
                    title: 'Google',
                    titleStyle: textTheme?.textMediumLink?.copyWith(
                      color: colorSchema?.grayscaleBodyText,
                    ),
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/icons/google.svg",
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'don\'t have an account ? ',
                  style: textTheme?.textSmall?.copyWith(
                    color: colorSchema?.grayscaleBodyText,
                  ),
                ),
                Text(
                  'Sign Up',
                  style: textTheme?.textSmallLink?.copyWith(
                    color: colorSchema?.primaryDefault,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
