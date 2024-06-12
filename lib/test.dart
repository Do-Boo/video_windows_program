import "package:flutter/foundation.dart" show kIsWeb;
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:video_app/data/page_data.dart";
import "package:video_app/main.dart";
import "package:video_app/widgets/w_main_app_bar.dart";
import "package:video_app/widgets/w_side_menu_bar.dart";
import "package:video_app/widgets/w_tag_menu_bar.dart";
import "package:video_app/widgets/w_window_title_bar.dart";

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData theme = Theme.of(context);
    final sideBarVisible = ref.watch(sideBarProvider);
    final pageName = ref.watch(pageNameProvider);
    final page = PageData();
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
                    // pageName == "Home" ? const SideMenuBar() : const SizedBox(),
                    const SideMenuBar(),
                    sideBarVisible ? Container(width: 216, color: theme.primaryColor) : const SizedBox(),
                  ],
                ),
                Expanded(
                  child: Column(
                    children: [
                      pageName == "Home" ? const TagMenubar() : const SizedBox(),
                      Expanded(child: page.menu.where((e) => e.title == pageName).toList().first.page),
                      // const Expanded(child: VideoPage()),
                      // const Expanded(child: MainPage()),
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
