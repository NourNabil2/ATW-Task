import 'package:atw_task/Core/utilts/Colors.dart';
import 'package:flutter/material.dart';


class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;

  const CustomAlertDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.confirmText,
    this.cancelText = 'Cancel',
    required this.onConfirm,
    this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).cardColor,
      title: Text(title, style: Theme.of(context).textTheme.titleLarge),
      content: Text(content),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: onCancel,
              child: Text(
                cancelText,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            TextButton(
              onPressed: onConfirm,
              child: Text(
                confirmText,
                style: const TextStyle(
                  color: ColorApp.redColor,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

void showCustomAlertDialog({
  required BuildContext context,
  required String title,
  required String content,
  required String confirmText,
  String cancelText = 'Cancel',
  required VoidCallback onConfirm,
  VoidCallback? onCancel,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return CustomAlertDialog(
        title: title,
        content: content,
        confirmText: confirmText,
        cancelText: cancelText,
        onConfirm: onConfirm,
        onCancel: onCancel,
      );
    },
  );
}
