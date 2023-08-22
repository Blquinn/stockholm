import 'package:flutter/material.dart';
import 'package:stockholm/src/dialog.dart';

class StockholmBlockingProgressDialog extends StatefulWidget {
  const StockholmBlockingProgressDialog({
    required this.title,
    required this.controller,
    super.key,
  });

  final StockholmBlockingProgressDialogController controller;

  final Widget title;

  @override
  State<StockholmBlockingProgressDialog> createState() =>
      StockholmBlockingProgressDialogState();
}

class StockholmBlockingProgressDialogState
    extends State<StockholmBlockingProgressDialog> {
  @override
  void initState() {
    super.initState();
    widget.controller._state = this;
  }

  String get progressMessage => widget.controller.progressMessage;

  @override
  Widget build(BuildContext context) {
    return StockholmDialog(
      title: widget.title,
      contents: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const LinearProgressIndicator(),
            const SizedBox(height: 8),
            Text(
              widget.controller.progressMessage,
            ),
          ],
        ),
      ),
    );
  }

  void close() {
    Navigator.of(context).pop();
  }

  void _controllerUpdated() {
    setState(() {});
  }
}

void showStockholmBlockingProgressDialog({
  required BuildContext context,
  required WidgetBuilder builder,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: builder,
  );
}

class StockholmBlockingProgressDialogController {
  StockholmBlockingProgressDialogController({
    required String progressMessage,
  }) : _progressMessage = progressMessage;

  StockholmBlockingProgressDialogState? _state;

  void dispose() {
    _state = null;
  }

  String _progressMessage;
  String get progressMessage => _progressMessage;
  set progressMessage(String value) {
    _progressMessage = value;
    _state?._controllerUpdated();
  }

  void close() {
    _state?.close();
  }
}
