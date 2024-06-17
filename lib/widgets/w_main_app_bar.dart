import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_app/main.dart';

class MainAppBar extends ConsumerStatefulWidget {
  const MainAppBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainAppBarState();
}

class _MainAppBarState extends ConsumerState<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkTheme = ref.watch(themeProvider);
    final sideBarVisible = ref.watch(sideBarProvider);
    final pageName = ref.watch(pageNameProvider);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 56,
      child: Row(
        children: [
          IconButton(
            icon: SvgPicture.asset(
              "assets/images/icons/icon_menu.svg",
              color: theme.hintColor,
            ),
            onPressed: () {
              if (pageName != "Home") {
                Scaffold.of(context).openDrawer();
              }
              ref.read(sideBarProvider.notifier).state = Scaffold.of(context).isDrawerOpen || (pageName == "Home" && !sideBarVisible);
            },
          ),
          const Text("타이틀"),
          const Expanded(child: TextField()),
          IconButton(icon: const Icon(Icons.ac_unit_sharp), onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.access_alarm),
              onPressed: () {
                ref.read(themeProvider.notifier).state = !isDarkTheme;
              }),
          IconButton(
              icon: const Icon(Icons.ac_unit_sharp),
              onPressed: () {
                ref.read(themeProvider.notifier).state = !isDarkTheme;
              }),
        ],
      ),
    );
  }
}
