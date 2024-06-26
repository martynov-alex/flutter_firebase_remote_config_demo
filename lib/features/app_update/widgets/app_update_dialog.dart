import 'package:flutter/material.dart';
import 'package:flutter_firebase_remote_config_demo/features/event/view/event_page.dart';
import 'package:flutter_firebase_remote_config_demo/util/url_launcher.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

void showAppUpdateDialog(
  BuildContext context, {
  required bool optional,
}) {
  showDialog(
    context: context,
    builder: (_) => _AppUpdateDialog(optional: optional),
    barrierDismissible: false,
  );
}

class _AppUpdateDialog extends ConsumerWidget {
  const _AppUpdateDialog({
    required this.optional,
  });

  final bool optional;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text('Update available'),
      content: const Text('A new version of the app is available.'),
      actions: [
        if (optional)
          TextButton(
            onPressed: () {
              context.go(EventPage.path);
            },
            child: const Text('Skip'),
          ),
        TextButton(
          onPressed: () =>
              ref.read(urlLauncherProvider).launchUrl('https://apps.apple.com'),
          child: const Text('Update'),
        ),
      ],
    );
  }
}
