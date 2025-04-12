import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../base/base_page.dart';
import 'comment_bloc.dart';

@RoutePage()
class CommentPage extends BasePage<CommentBloc, CommentEvent, CommentState> {
  const CommentPage({Key? key}) : super(key: key);

  @override
  void onInitState(BuildContext context) {
    context.read<CommentBloc>().add(const CommentEvent.loadData());
    super.onInitState(context);
  }

  @override
  Widget builder(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Màn comment')));
  }
}
