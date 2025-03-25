import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';

class AppCardLoading extends StatelessWidget {
  const AppCardLoading({
    Key? key,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: padding,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardLoading(
              height: 30,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              width: 100,
              margin: EdgeInsets.only(bottom: 10),
            ),
            CardLoading(
              height: 100,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              margin: EdgeInsets.only(bottom: 10),
            ),
            CardLoading(
              height: 30,
              width: 200,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              margin: EdgeInsets.only(bottom: 10),
            ),
          ],
        ),
      ),
    );
  }
}
