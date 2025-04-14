import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/gen/assets.gen.dart';
import 'package:flutter_clean_architecture/presentation/router/router.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/app_form_field.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';
import 'package:gap/gap.dart';

import '../../../base/base_page.dart';
import 'edit_profile_bloc.dart';

@RoutePage()
class EditProfilePage
    extends BasePage<EditProfileBloc, EditProfileEvent, EditProfileState> {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  void onInitState(BuildContext context) {
    context.read<EditProfileBloc>().add(const EditProfileEvent.loadData());
    super.onInitState(context);
  }

  @override
  Widget builder(BuildContext context) {
    final usernameController = TextEditingController();
    final fullNameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();
    final bioController = TextEditingController();
    final websiteController = TextEditingController();
    final textTheme = context.themeOwn().textTheme;
    final colorSchema = context.themeOwn().colorSchema;
    final iconColor = Theme.of(context).iconTheme.color;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          shadowColor: Colors.transparent,
          leading: IconButton(
            padding: const EdgeInsets.only(left: 16),
            onPressed: context.pop,
            icon: Assets.icons.backIcon.svg(),
          ),
          title: Text(
            'Edit Profile',
            style: textTheme?.textMediumLink?.copyWith(
              color: colorSchema?.darkBlack,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: InkWell(
                child: Assets.icons.ok.svg(color: iconColor),
                onTap: () {
                  final username = usernameController.text.trim();
                  final fullName = fullNameController.text.trim();
                  final email = emailController.text.trim();
                  final phone = phoneController.text.trim();

                  if (username.isEmpty ||
                      fullName.isEmpty ||
                      email.isEmpty ||
                      phone.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                          'Vui lòng điền đầy đủ các thông tin',
                          style: TextStyle(fontSize: 20),
                        ),
                        backgroundColor: colorSchema?.errorDark ?? Colors.red,
                      ),
                    );
                    return;
                  }

                  // dùng regex kiểm tra email và phone
                  final emailRegex = RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  );
                  final phoneRegex = RegExp(r'^\d{9,15}$');

                  if (!emailRegex.hasMatch(email)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Email không hợp lệ',
                          style: TextStyle(fontSize: 30),
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  if (!phoneRegex.hasMatch(phone)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Số điện thoại không hợp lệ',
                          style: TextStyle(fontSize: 30),
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  // Gửi event đến Bloc
                  context.read<EditProfileBloc>().add(
                    EditProfileEvent.saveProfile(
                      username: username,
                      fullName: fullName,
                      email: email,
                      phoneNumber: phone,
                      bio: bioController.text.trim(),
                      website: websiteController.text.trim(),
                    ),
                  );

                  context.pushRoute(const ProfileRoute());
                },
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
                Center(
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 140,
                        height: 140,
                        child: ClipOval(
                          child: Image.network(
                            'https://avatars.githubusercontent.com/u/119520066?v=4',
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 16,
                        child: Assets.icons.uploadIcon.svg(),
                      ),
                    ],
                  ),
                ),
                BlocBuilder<EditProfileBloc, EditProfileState>(
                  buildWhen: (preState, state) {
                    return preState.currentUser != state.currentUser;
                  },
                  builder: (context, state) {
                    final user = state.currentUser;

                    if (user == null) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    usernameController.text = user.username;
                    fullNameController.text = user.fullName ?? '';
                    emailController.text = user.email;
                    phoneController.text = user.phoneNumber;
                    bioController.text = user.bio ?? '';
                    websiteController.text = user.website ?? '';
                    return Column(
                      children: [
                        const Gap(16),
                        AppFormField(
                          label: 'Username',
                          controller: usernameController,
                        ),
                        const Gap(16),
                        AppFormField(
                          label: 'Full name',
                          controller: fullNameController,
                        ),
                        const Gap(16),
                        AppFormField(
                          label: 'Email Address',
                          required: true,
                          controller: emailController,
                        ),
                        const Gap(16),
                        AppFormField(
                          label: 'Phone number',
                          required: true,
                          controller: phoneController,
                        ),
                        const Gap(16),
                        AppFormField(label: 'Bio', controller: bioController),
                        const Gap(16),
                        AppFormField(
                          label: 'Website',
                          controller: websiteController,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
