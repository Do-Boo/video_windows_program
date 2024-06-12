import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:video_app/data/tag_menu_data.dart';
import 'package:video_app/main.dart';

class TagMenubar extends ConsumerStatefulWidget {
  const TagMenubar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TagMenubarState();
}

class _TagMenubarState extends ConsumerState<TagMenubar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final data = TagMenuData();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      height: 36,
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 16.0,
        children: data.menu
            .map(
              (e) => InkWell(
                borderRadius: BorderRadius.circular(4),
                splashColor: theme.scaffoldBackgroundColor.withOpacity(0.1),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onSurface.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(e.title),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
