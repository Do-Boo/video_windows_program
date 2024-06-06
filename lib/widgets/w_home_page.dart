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
    var size = MediaQuery.of(context).size;

    final itemWidth = size.width / 2;
    final itemHeight = itemWidth * 0.8;

    return Padding(
      padding: const EdgeInsets.all(4),
      child: GridView.count(
        crossAxisCount: 4,
        childAspectRatio: (itemWidth / itemHeight),
        children: List.generate(100, (index) {
          return Container(
            alignment: Alignment.center,
            // height: 30,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
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
