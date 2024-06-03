import "dart:io" show Platform;
import "package:flutter/foundation.dart" show kIsWeb;
import "package:bitsdojo_window/bitsdojo_window.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:video_app/test.dart";
import "package:video_app/theme/app_theme.dart";

final themeProvider = StateProvider<bool>((ref) => true);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
  setupWindow();
}

void setupWindow() {
  if (!kIsWeb && (Platform.isWindows || Platform.isMacOS)) {
    doWhenWindowReady(() {
      const initialSize = Size(1200, 800);
      appWindow.minSize = initialSize;
      appWindow.size = initialSize;
      appWindow.alignment = Alignment.center;
      appWindow.show();
    });
  }
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(themeProvider);
    return MaterialApp(
      theme: appThemeData[AppTheme.Light],
      darkTheme: appThemeData[AppTheme.Dark],
      themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      home: const MyHomePage(),
      // debugShowCheckedModeBanner: false,
    );
  }
}
