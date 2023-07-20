import 'package:flutter/material.dart';

class GeneralDialogBoxes {
  const GeneralDialogBoxes._();

  static Future<void> showLoadingSpinningCircle({
    required BuildContext buildContext,
    String message = 'Loading...',
  }) {
    return showDialog(
      context: buildContext,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const CircularProgressIndicator.adaptive(),
                const SizedBox(height: 12.0),
                Text(message),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<bool> showYesOrNoAlert({
    required BuildContext buildContext,
    required String title,
    required String contentMessage,
  }) async {
    return await showDialog<bool>(
          context: buildContext,
          barrierDismissible: false,
          builder: (BuildContext buildContext) {
            return AlertDialog(
              title: Text(title),
              content: Text(
                contentMessage,
                style: Theme.of(buildContext).textTheme.bodyLarge,
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(buildContext).pop(true);
                  },
                  child: const Text('Yes'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(buildContext).pop(false);
                  },
                  child: const Text('No'),
                ),
              ],
            );
          },
        ) ??
        false;
  }
}
