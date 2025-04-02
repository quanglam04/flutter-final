import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/gen/assets.gen.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/app_form_field.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';

import '../../../base/base_page.dart';
import 'search_bloc.dart';

@RoutePage()
class SearchPage extends BasePage<SearchBloc, SearchEvent, SearchState> {
  const SearchPage({Key? key}) : super(key: key);

  @override
  void onInitState(BuildContext context) {
    context.read<SearchBloc>().add(const SearchEvent.loadData());
    super.onInitState(context);
  }

  @override
  Widget builder(BuildContext context) {
    final List<String> listCategory = ["News", "Topics", "Author"];
    final colorSchema = context.themeOwn().colorSchema;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 68),
        child: Column(
          children: [
            AppFormField(
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Assets.icons.search.svg(),
                ),
                suffixIcon: Assets.icons.clearAll.svg(),
                prefixStyle: TextStyle(color: colorSchema?.grayscaleBodyText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
