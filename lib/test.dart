import "package:flutter/foundation.dart" show kIsWeb;
import "package:bitsdojo_window/bitsdojo_window.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_svg/svg.dart";
import "package:video_app/main.dart";

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(themeProvider);
    return Scaffold(
      body: Column(
        children: [
          !kIsWeb ? const WindowTitleBar() : const SizedBox(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 56,
            child: Row(
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    "assets/images/icons/icon_menu.svg",
                    color: isDarkTheme ? Colors.white : Colors.black,
                    colorBlendMode: BlendMode.srcIn,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const Expanded(child: Placeholder()),
        ],
      ),
    );
  }
}

class WindowTitleBar extends ConsumerWidget {
  const WindowTitleBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: const Color(0x000000ff),
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
    );
  }
}
