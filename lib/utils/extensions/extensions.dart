import 'package:flutter/material.dart';

/// An extension on [BuildContext] that adds a method to show a [SnackBar] widget.
extension BuildContextSnackBarExtension on BuildContext {
  /// Shows a [SnackBar] widget with the given [message] and [duration].
  ///
  /// The default value for [duration] is 3 seconds.
  void showSnackBar({
    required String message,
    Duration duration = const Duration(seconds: 3),
    bool isSuccess = true,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white),),
        duration: duration,
        backgroundColor: isSuccess ? Colors.green : Colors.red,
      ),
    );
  }
}