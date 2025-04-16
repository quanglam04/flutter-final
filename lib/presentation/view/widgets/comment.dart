import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  final String avatar;
  final String name;
  final String comment;
  final String time;
  final String likes;
  final int replyCount;
  final List<Widget> replies;

  const Comment({
    Key? key,
    required this.avatar,
    required this.name,
    required this.comment,
    required this.time,
    required this.likes,
    this.replyCount = 0,
    this.replies = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(backgroundImage: AssetImage(avatar), radius: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(comment, style: const TextStyle(fontSize: 15)),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          time,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(
                          Icons.favorite_border,
                          size: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '$likes likes',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'reply',
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (replies.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 48, top: 8),
              child: Column(children: replies),
            ),
          if (replyCount > 0)
            Padding(
              padding: const EdgeInsets.only(left: 48, top: 10),
              child: Text(
                'See more ($replyCount)',
                style: const TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
        ],
      ),
    );
  }
}
