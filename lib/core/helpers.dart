import 'package:flutter/material.dart';
import 'package:luca/core/utils/logging.dart';
import 'package:luca/navigation/app_navigator.dart';

/// does... nothing ;)
T? doNothing<T>() {
  return null;
}

/// shows dialog with "not implemented" message. its var so that it can be replaced for tests
void Function({BuildContext? context, String? message}) notImplemented =
    ({String? message, BuildContext? context}) {
  logError(
    UnimplementedError(
      'not implemented${message == null ? '' : ':\n$message'}',
    ),
    StackTrace.current,
  );
  showDialog(
    context: context ?? AppNavigator.navigatorKey.currentContext!,
    builder: (context) => AlertDialog(
      title: const Text('Not implemented'),
      content: Text(message ?? "This feature is not yet implemented"),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('OK'),
        ),
      ],
    ),
  );
};

/// method that allows suppressing the `unused-code` metric
/// https://github.com/dart-code-checker/dart-code-metrics/pull/929
void suppressUnusedCodeWarning(dynamic anything) => doNothing();

bool validatePassword(String value) {
  const pattern = 'test123';
  final regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}

bool validateUsername(String value) {
  const pattern = 'test';
  final regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}
