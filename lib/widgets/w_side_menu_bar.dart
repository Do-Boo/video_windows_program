import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_app/data/side_menu_data.dart';
import 'package:video_app/main.dart';

class SideMenuBar extends ConsumerStatefulWidget {
  const SideMenuBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SideMenuBarState();
}

class _SideMenuBarState extends ConsumerState<SideMenuBar> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final data = SideMenuData();
    final sideBarVisible = ref.watch(sideBarProvider);
    return Container(
      width: sideBarVisible ? 216 : 72,
      color: theme.primaryColor,
      child: ListView.builder(
        itemCount: data.menu.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            width: double.infinity,
            height: sideBarVisible ? 58 : 72,
            child: Material(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                splashColor: theme.scaffoldBackgroundColor.withOpacity(0.1),
                child: Flex(
                  mainAxisAlignment: sideBarVisible ? MainAxisAlignment.start : MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  direction: sideBarVisible ? Axis.horizontal : Axis.vertical,
                  children: [
                    sideBarVisible ? const SizedBox(width: 20) : const SizedBox(),
                    Icon(
                      data.menu[index].icon,
                      color: theme.colorScheme.onSurface,
                    ),
                    sideBarVisible ? const SizedBox(width: 20) : const SizedBox(),
                    Text(
                      data.menu[index].title,
                      style: TextStyle(
                        fontSize: sideBarVisible ? 14 : 10,
                        color: theme.colorScheme.onSurface,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Scaffold.of(context).closeDrawer();
                  ref.watch(sideBarProvider.notifier).state = Scaffold.of(context).isEndDrawerOpen;
                  ref.watch(pageNameProvider.notifier).state = data.menu[index].title;
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
