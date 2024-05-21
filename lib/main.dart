import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_app/test.dart';
import 'package:video_app/theme/app_theme.dart';

final themeProvider = StateProvider<bool>((ref) => false);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Window.initialize();
  runApp(const ProviderScope(child: MyApp()));
  doWhenWindowReady(() {
    final win = appWindow;
    const initialSize = Size(600, 450);
    win.minSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "Custom Window Demo";
    win.show();
  });
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(themeProvider);
    return MaterialApp(
      title: "Flutter Demo",
      theme: appThemeData[AppTheme.Light],
      darkTheme: appThemeData[AppTheme.Dark],
      themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      home: const MyHomePage(title: "Flutter Demo Home Page"),
      debugShowCheckedModeBanner: false,
    );
  }
}
