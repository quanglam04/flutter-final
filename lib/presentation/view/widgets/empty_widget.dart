import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/shared/extension/context.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({required this.emptyMessage, this.type});

  final String emptyMessage;

  final EmptyType? type;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          Text(
            emptyMessage,
            style: TextStyle(color: context.themeOwn().colorSchema?.subText),
          ),
        ],
      ),
    );
  }
}

enum EmptyType { emptyDefault, emptyPieChart, emptyBarChart, emptyLineChart }