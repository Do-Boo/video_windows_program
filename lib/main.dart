import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_app/test.dart';
import 'package:video_app/theme/app_theme.dart';
import 'package:video_app/theme_notifier.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeNotifier>(create: (e) => ThemeNotifier()),
    ],
    child: const MyApp(),
  ));
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
