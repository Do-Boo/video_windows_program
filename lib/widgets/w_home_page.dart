import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    final widgetWidth = width / (width / 300).toInt();

    return Padding(
      padding: const EdgeInsets.all(4),
      child: GridView.count(
        crossAxisCount: (width / 300).toInt(),
        childAspectRatio: (widgetWidth / (widgetWidth * 0.8)),
        children: List.generate(100, (index) {
          return Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: theme.hintColor,
                width: 1,
              ),
            ),
            child: Text(
              'Item $index',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          );
        }),
      ),
    );
  }
}
