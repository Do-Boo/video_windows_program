import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_app/data/side_menu_data.dart';

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
    return Container(
      width: 72,
      color: theme.primaryColor,
      child: ListView.builder(
        itemCount: data.menu.length,
        itemBuilder: (context, index) => SideMenuList(data: data, index: index),
      ),
    );
  }
}

class SideMenuList extends StatelessWidget {
  final SideMenuData data;
  final int index;

  const SideMenuList({super.key, required this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      width: double.infinity,
      height: 72,
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor: theme.scaffoldBackgroundColor.withOpacity(0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                data.menu[index].icon,
                color: theme.colorScheme.onSurface,
              ),
              Text(
                data.menu[index].title,
                style: TextStyle(
                  fontSize: 10,
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
