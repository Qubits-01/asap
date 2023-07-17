import 'package:flutter/material.dart';

class LoadingIndicatorsUtil {
  const LoadingIndicatorsUtil._();

  static Future<void> showSpinningCircleOnDialogBox({
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
}
