import 'package:example/src/demo_page.dart';
import 'package:flutter/material.dart';
import 'package:stockholm/stockholm.dart';

class StockholmDialogDemoPage extends StatelessWidget {
  const StockholmDialogDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const StockholmDemoPage(children: [
      _DialogDemo(),
      _ConfirmationDialogDemo(),
      _BlockingProgressDialogDemo(),
    ]);
  }
}

class _DialogDemo extends StatelessWidget {
  const _DialogDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoSection(
      title: 'Dialog',
      child: Row(
        children: [
          StockholmDialog(
            width: 280,
            title: const Text('Dialog Title'),
            contents: const SizedBox(
              height: 100,
              child: Center(
                child: Text('Content'),
              ),
            ),
            actionButtons: [
              StockholmButton(
                onPressed: () {},
                child: const Text('First Action'),
              ),
              StockholmButton(
                onPressed: () {},
                important: true,
                child: const Text('Second Action'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ConfirmationDialogDemo extends StatelessWidget {
  const _ConfirmationDialogDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoSection(
      title: 'Confirmation Dialog',
      child: Row(
        children: [
          StockholmButton(
            onPressed: () {
              showStockholmConfirmationDialog(
                context: context,
                onSelection: (result) {
                  // Handle the results here.
                  // True if user clicked primary option (OK).
                },
                title: const Text('Confirmation Dialog'),
                contents: const Text('Are you sure you want to click OK?'),
              );
            },
            child: const Text('Show Confirmation Dialog'),
          ),
        ],
      ),
    );
  }
}

class _BlockingProgressDialogDemo extends StatefulWidget {
  const _BlockingProgressDialogDemo({Key? key}) : super(key: key);

  @override
  State<_BlockingProgressDialogDemo> createState() =>
      _BlockingProgressDialogDemoState();
}

class _BlockingProgressDialogDemoState
    extends State<_BlockingProgressDialogDemo> {
  final _controller = StockholmBlockingProgressDialogController(
    progressMessage: 'Making progress.',
  );

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DemoSection(
      title: 'Blocking Progress Dialog',
      child: Row(
        children: [
          StockholmButton(
            onPressed: () async {
              showStockholmBlockingProgressDialog(
                  context: context,
                  builder: (context) {
                    return StockholmBlockingProgressDialog(
                      title: const Text('Blocking Progress Dialog'),
                      controller: _controller,
                    );
                  });
              await Future.delayed(const Duration(seconds: 1));
              _controller.progressMessage = 'Still making progress.';
              await Future.delayed(const Duration(seconds: 1));
              _controller.progressMessage = 'Just hang tight.';
              await Future.delayed(const Duration(seconds: 1));
              _controller.close();
            },
            child: const Text('Show Blocking Progress Dialog'),
          ),
        ],
      ),
    );
  }
}
