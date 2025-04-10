import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/gen/assets.gen.dart';
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
              child: InkWell(child: Assets.icons.ok.svg(), onTap: context.pop),
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

                    return Column(
                      children: [
                        const Gap(16),
                        AppFormField(label: 'Username', value: user.username),
                        const Gap(16),
                        AppFormField(
                          label: 'Full name',
                          value: user.fullName ?? '',
                        ),
                        const Gap(16),
                        AppFormField(
                          label: 'Email Address',
                          required: true,
                          value: user.email,
                        ),
                        const Gap(16),
                        AppFormField(
                          label: 'Phone number',
                          required: true,
                          value: user.phoneNumber,
                        ),
                        const Gap(16),
                        AppFormField(label: 'Bio', value: user.bio ?? ''),
                        const Gap(16),
                        AppFormField(
                          label: 'Website',
                          value: user.website ?? '',
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
