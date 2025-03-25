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
    final textTheme = context.themeOwn().textTheme?.textDisplayLargeBold;
    final colorSchema = context.themeOwn().colorSchema;


    return Padding(
      padding: const EdgeInsets.only(top: 44, left: 24, right: 24, bottom: 8),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'HELLO',
              style: textTheme?.copyWith(
                  color: colorSchema?.grayscaleBodyText,
              ),
            ),
            Text(
              'AGAIN',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                height: 72 / 48,
                color: Color(0xff1877F2),
              ),
            ),
            Text(
              'Welcome back you’ve \nbeen missed',
              style: TextStyle(
                fontSize: 20,
                height: 1.5,
                color: Color(0xFF4E4B66),
              ),
            ),
            const SizedBox(height: 52),
            Row(
              children: [
                Text(
                  'Username',
                  style: context.themeOwn().textTheme?.textSmall,
                ),
                Text(
                  '*',
                  style: TextStyle(
                    fontSize: 14,
                    height: 21 / 14,
                    color: Color(0xFFC30052),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            AppFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 14,
                    height: 21 / 14,
                    color: Color(0xFF4E4B66),
                  ),
                ),
                Text(
                  '*',
                  style: TextStyle(
                    fontSize: 14,
                    height: 21 / 14,
                    color: Color(0xFFC30052),
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
                        activeColor: Color(0xFF1877F2),
                        onChanged: (x) {},
                      ),
                    ),
                    const SizedBox(width: 1.5),
                    const Text(
                      'Remember me',
                      style: TextStyle(
                        fontSize: 14,
                        height: 21 / 14,
                        color: Color(0xFF4E4B66),
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
            Container(
              height: 50,
              child: AppButton.primary(
                backgroundColor: Color(0xFF1877F2),
                title: 'Login',
                titleStyle: TextStyle(fontSize: 16),
                onPressed: () {},
              ),
            ),
            SizedBox(height: 16),

            Align(
              alignment: Alignment.center,
              child: const Text(
                'or continue with',
                style: TextStyle(color: Color(0xFF4E4B66)),
              ),
            ),
            SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AppButton.primary(
                    height: 48,
                    backgroundColor: Color(0xFFEEF1F4),
                    title: 'Facebook',
                    titleStyle: TextStyle(
                      color: Color(0xFF667080),
                      fontSize: 16,
                    ),
                    onPressed: () {},
                    icon: Assets.icons.facebook.svg(),
                  ),
                ),
                const SizedBox(width: 31),
                Expanded(
                  child: AppButton.primary(
                    backgroundColor: Color(0xFFEEF1F4),
                    title: 'Google',
                    titleStyle: TextStyle(
                      color: Color(0xFF667080),
                      fontSize: 16,
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'don\'t have an account ? ',
                  style: TextStyle(height: 21 / 14, color: Color(0xFF4E4B66)),
                ),
                Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Color(0xFF1877F2),
                    fontWeight: FontWeight.bold,
                    height: 21 / 14,
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
