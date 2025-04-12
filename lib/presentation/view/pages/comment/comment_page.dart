import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/gen/assets.gen.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/comment.dart';
import 'package:flutter_clean_architecture/presentation/view/widgets/reply.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';

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
    final iconColor = Theme.of(context).iconTheme.color;
    final textTheme = context.themeOwn().textTheme;
    final colorSchema = context.themeOwn().colorSchema;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        shadowColor: Colors.transparent,
        title: Text(
          'Comments',
          style: textTheme?.textMedium?.copyWith(color: colorSchema?.darkBlack),
        ),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Assets.icons.backIcon.svg(color: iconColor),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                children: const [
                  Comment(
                    avatar: 'assets/images/avt.jpg',
                    name: 'Wilson Franci',
                    comment:
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    time: '4w',
                    likes: '125',
                    replies: [
                      Reply(
                        avatar: 'assets/images/avt.jpg',
                        name: 'Madelyn Saris',
                        comment:
                            'Lorem Ipsum is simply dummy text of the printing and type...',
                        time: '4w',
                        likes: '3',
                      ),
                    ],
                    replyCount: 2,
                  ),
                  Comment(
                    avatar: 'assets/images/avt.jpg',
                    name: 'Marley Botosh',
                    comment:
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    time: '4w',
                    likes: '12',
                    replyCount: 2,
                  ),
                  Comment(
                    avatar: 'assets/images/avt.jpg',
                    name: 'Alfonso Septimus',
                    comment:
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    time: '4w',
                    likes: '14K',
                    replyCount: 58,
                  ),
                  Comment(
                    avatar: 'assets/images/avt.jpg',
                    name: 'Omar Herwitz',
                    comment:
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    time: '4w',
                    likes: '16',
                  ),
                  Comment(
                    avatar: 'assets/images/avt.jpg',
                    name: 'Corey Geidt',
                    comment:
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    time: '4w',
                    likes: '10',
                  ),
                  Comment(
                    avatar: 'assets/images/avt.jpg',
                    name: 'Corey Geidt',
                    comment:
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    time: '4w',
                    likes: '10',
                  ),
                  Comment(
                    avatar: 'assets/images/avt.jpg',
                    name: 'Corey Geidt',
                    comment:
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    time: '4w',
                    likes: '10',
                  ),
                  Comment(
                    avatar: 'assets/images/avt.jpg',
                    name: 'Corey Geidt',
                    comment:
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    time: '4w',
                    likes: '10',
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Type your comment',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: colorSchema?.whiteText,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(2),
                    child: Assets.icons.send.svg(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
