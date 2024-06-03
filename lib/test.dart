import "package:flutter/foundation.dart" show kIsWeb;
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:video_app/widgets/main_app_bar.dart";
import "package:video_app/widgets/side_menu_bar.dart";
import "package:video_app/widgets/window_title_bar.dart";

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          !kIsWeb ? const WindowTitleBar() : const SizedBox(),
          const MainAppBar(),
          Expanded(
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 72,
                      color: theme.primaryColor,
                      child: const SideMenuBar(),
                    ),
                    // Container(width: 216, color: theme.primaryColor),
                  ],
                ),
                const Expanded(
                  child: Stack(
                    children: [
                      Placeholder(),
                      SizedBox(
                        height: 42,
                        child: Placeholder(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
