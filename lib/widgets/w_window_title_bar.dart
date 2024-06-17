import "package:flutter/foundation.dart" show kIsWeb;
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WindowTitleBar extends ConsumerWidget {
  const WindowTitleBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return !kIsWeb
        ? Container(
            color: theme.primaryColor,
            height: 30,
            child: WindowTitleBarBox(
              child: Row(
                children: [
                  Expanded(child: MoveWindow()),
                  MinimizeWindowButton(),
                  MaximizeWindowButton(),
                  CloseWindowButton(),
                ],
              ),
            ),
          )
        : const SizedBox();
  }
}
