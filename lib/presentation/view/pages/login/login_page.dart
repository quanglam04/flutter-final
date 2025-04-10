import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/domain/entities/user.dart';
import 'package:flutter_clean_architecture/gen/assets.gen.dart';
import 'package:flutter_clean_architecture/presentation/router/router.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/app_button.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/app_form_field.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';
import 'package:flutter_clean_architecture/shared/utils/logger.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: ['email', 'https://www.googleapis.com/auth/contacts.readonly'],
    );
    final textTheme = context.themeOwn().textTheme;
    final colorSchema = context.themeOwn().colorSchema;

    return Scaffold(
      body: Padding(
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
              AppFormField(),
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
              AppFormField(
                obscureText: true,
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.visibility_off,
                      color: colorSchema?.grayscaleBodyText,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
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
                onPressed: () => context.pushRoute(HomeRoute()),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'or continue with',
                  style: textTheme?.textSmall?.copyWith(
                    color: colorSchema?.grayscaleBodyText,
                  ),
                ),
              ),
              const SizedBox(height: 16),
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
                      onPressed: () async {
                        try {
                          await _googleSignIn.signOut();
                          final GoogleSignInAccount? googleUser =
                              await _googleSignIn.signIn();

                          if (googleUser != null) {
                            CurrentUser user = new CurrentUser(
                              googleUser.id,
                              googleUser.displayName ?? '',
                              googleUser.photoUrl ?? '',
                              googleUser.email.split('@')[0],
                              googleUser.email,
                              '0971624914',
                              'trinhquanglam.com',
                              'trinhquanglam.bio.com',
                            );
                            await saveUserToLocal(user);
                            logger.d("$googleUser");
                            logger.d("login successsssssssssssss");
                            context.pushRoute(const NavigationRoute());
                          } else {
                            print("login failed");
                          }
                        } catch (error) {
                          logger.d("error>>>>>>>>>>>>>>>>>>>>>>>>> $error");
                        }
                      },
                      icon: Assets.icons.google.svg(),
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
      ),
    );
  }
}

Future<void> saveUserToLocal(CurrentUser user) async {
  final prefs = await SharedPreferences.getInstance();
  final userMap = {
    'id': user.id,
    'fullName': user.fullName,
    'imgPath': user.imagePath,
    'email': user.email,
    'username': user.username,
    'phoneNumber': user.phoneNumber,
    'bio': user.bio,
    'website': user.website,
  };

  final jsonString = jsonEncode(userMap);
  await prefs.setString('user_data', jsonString);
}
