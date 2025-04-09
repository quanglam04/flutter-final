import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../base/base_page.dart';
import 'bookmark_bloc.dart';

@RoutePage()
class BookmarkPage
    extends BasePage<BookmarkBloc, BookmarkEvent, BookmarkState> {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  void onInitState(BuildContext context) {
    context.read<BookmarkBloc>().add(const BookmarkEvent.loadData());
    super.onInitState(context);
  }

  @override
  Widget builder(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Màn hình Bookmark')),
      body: const Center(child: Text('màn hình Bookmark')),
    );
  }
}
