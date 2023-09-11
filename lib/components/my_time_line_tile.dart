import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyTimelineTile extends StatelessWidget {
  final bool isLast;
  final bool isFirst;
  final Widget endChild;

  const MyTimelineTile({
    Key? key,
    required this.isLast,
    required this.isFirst,
    required this.endChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isLast: isLast,
      isFirst: isFirst,
      endChild: endChild,
    );
  }
}
