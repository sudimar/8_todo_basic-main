import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String title;
  final String description;
  final String date;

  /// This is used for passing a custom
  /// function callback when the `InkWell`
  /// in this widget is pressed.
  final VoidCallback? onItemPressed;

  const TodoItem({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    this.onItemPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      /// This is how you use the custom function callback.
      onTap: onItemPressed,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 100,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  Text(description),
                  Text(date),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
