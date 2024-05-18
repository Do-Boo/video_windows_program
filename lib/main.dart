import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:provider/provider.dart';
import 'package:video_app/test.dart';
import 'package:video_app/theme/app_theme.dart';
import 'package:video_app/theme_notifier.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Window.initialize();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeNotifier>(create: (context) => ThemeNotifier()),
    ],
    child: const MyApp(),
  ));
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      title: "Flutter Demo",
      theme: appThemeData[AppTheme.Light],
      darkTheme: appThemeData[AppTheme.Dark],
      themeMode: themeNotifier.darkTheme ? ThemeMode.dark : ThemeMode.light,
      home: const MyHomePage(title: "Flutter Demo Home Page"),
      debugShowCheckedModeBanner: false,
    );
  }
}
