import "package:flutter/foundation.dart" show kIsWeb;
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_svg/svg.dart";
import "package:video_app/data/page_data.dart";
import "package:video_app/main.dart";
import "package:video_app/widgets/w_main_app_bar.dart";
import "package:video_app/widgets/w_side_menu_bar.dart";
import "package:video_app/widgets/w_tag_menu_bar.dart";
import "package:video_app/widgets/w_window_title_bar.dart";

class MyHomePage extends ConsumerWidget {
  MyHomePage({super.key});
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData theme = Theme.of(context);
    final sideBarVisible = ref.watch(sideBarProvider);
    final pageName = ref.watch(pageNameProvider);
    final page = PageData();
    return Scaffold(
      key: _scaffoldKey,
      drawer: Builder(
        builder: (context) => Container(
          padding: const EdgeInsets.only(top: 30),
          width: 216,
          color: theme.primaryColor,
          child: Drawer(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 56,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: SvgPicture.asset(
                          "assets/images/icons/icon_menu.svg",
                          color: theme.hintColor,
                        ),
                        onPressed: () {
                          if (pageName != "Home") {
                            _scaffoldKey.currentState!.closeDrawer();
                          }
                          ref.read(sideBarProvider.notifier).state = _scaffoldKey.currentState!.isEndDrawerOpen || (pageName == "Home" && !sideBarVisible);
                        },
                      ),
                      const Text("타이틀"),
                    ],
                  ),
                ),
                const Expanded(child: SideMenuBar()),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const WindowTitleBar(),
          const MainAppBar(),
          Expanded(
            child: Row(
              children: [
                if (pageName == "Home")
                  Container(
                    width: sideBarVisible ? 216 : 72,
                    color: theme.primaryColor,
                    child: const SideMenuBar(),
                  ),
                Expanded(
                  child: Column(
                    children: [
                      pageName == "Home" ? const TagMenubar() : const SizedBox(),
                      Expanded(child: page.menu.where((e) => e.title == pageName).toList().first.page),
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
