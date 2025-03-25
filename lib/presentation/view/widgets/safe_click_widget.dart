import 'package:flutter/material.dart';

class SafeClickWidget extends StatelessWidget {
  const SafeClickWidget({
    Key? key,
    this.onPressed,
    required this.child,
    this.intervalMs = 500,
    this.splashFactory = InkSparkle.splashFactory,
    this.borderRadius,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Widget child;
  final int intervalMs;
  final InteractiveInkFeatureFactory? splashFactory;
  final BorderRadius? borderRadius;

  static DateTime? _clickTime;

  @override
  Widget build(BuildContext context) {
    final onTap = onPressed != null
        ? () {
            if (_isValidClick(DateTime.now(), intervalMs)) {
              onPressed?.call();
            }
          }
        : null;
    return InkWell(
      onTap: onTap,
      child: child,
      borderRadius: borderRadius,
      splashFactory: splashFactory,
    );
  }

  bool _isValidClick(DateTime currentTime, int intervalMs) {
    if (_clickTime == null) {
      _clickTime = currentTime;
      return true;
    }
    if (currentTime.difference(_clickTime!).inMilliseconds < intervalMs) {
      return false;
    }

    _clickTime = currentTime;
    return true;
  }
}
