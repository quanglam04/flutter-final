import 'package:flutter/material.dart';

import 'app_card_loading.dart';

class AppListCardLoading extends StatelessWidget {
  const AppListCardLoading({
    Key? key,
    this.itemCount = 4,
    this.padding = const EdgeInsets.all(16),
  }) : super(key: key);

  final int itemCount;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: ListView.separated(
          padding: padding,
          itemCount: itemCount,
          shrinkWrap: true,
          itemBuilder: (_, __) => const AppCardLoading(),
          separatorBuilder: (_, __) => const SizedBox(height: 12),
        ),
      ),
    );
  }
}