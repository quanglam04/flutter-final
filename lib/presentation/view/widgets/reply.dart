import 'package:flutter/material.dart';

class Reply extends StatelessWidget {
  final String avatar;
  final String name;
  final String comment;
  final String time;
  final String likes;

  const Reply({
    Key? key,
    required this.avatar,
    required this.name,
    required this.comment,
    required this.time,
    required this.likes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(comment, style: const TextStyle(fontSize: 14)),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    time,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.favorite,
                    size: 14,
                    color: Colors.pinkAccent,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '$likes likes',
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'reply',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
