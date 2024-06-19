import 'package:flutter/material.dart';
import 'package:hadirku_web/utils/utils.dart';

class ImageTooltip extends StatelessWidget {
  final Widget child;
  final String message;
  const ImageTooltip({super.key, required this.child, required this.message});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<State<Tooltip>>();
    return Tooltip(
      key: key,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: TooltipBorder(arrowArc: 0.1),
      ),
      textStyle: Theme.of(context).textTheme.labelMedium,
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      message: message,
      verticalOffset: 25,
      waitDuration: const Duration(seconds: 10),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => _onTap(key),
        child: child,
      ),
    );
  }

  void _onTap(GlobalKey key) {
    final dynamic tooltip = key.currentState;
    tooltip?.ensureTooltipVisible();
  }
}
