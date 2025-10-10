import 'package:flutter/material.dart';

class FullScreenDialog extends StatelessWidget {
  const FullScreenDialog({
    required this.title,
    required this.child,
    super.key,
  });

  final String title;
  final Widget child;

  static Future<T?> show<T>(BuildContext context, {
    required String title,
    required Widget child,
  }) {
    return showDialog<T>(
      context: context,
      fullscreenDialog: true,
      useSafeArea: false,
      builder: (context) {
        return FullScreenDialog(
          title: title,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: child,
    );
  }
}
