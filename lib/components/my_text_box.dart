import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  final Widget widget;
  final String title;

  const MyTextBox({Key? key, required this.widget, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
      decoration: BoxDecoration(
        color: Theme.of(context).highlightColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.grey.shade500, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          widget,
        ],
      ),
    );
  }
}
