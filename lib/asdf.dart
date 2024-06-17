import "dart:io" show Platform;
import "package:flutter/foundation.dart" show kIsWeb;
import "package:bitsdojo_window/bitsdojo_window.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:media_kit/media_kit.dart";
import "package:video_app/test.dart";
import "package:video_app/theme/app_theme.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
  setupWindow();
}

void setupWindow() {
  if (!kIsWeb && (Platform.isWindows || Platform.isMacOS)) {
    doWhenWindowReady(() {
      const initialSize = Size(800, 500);
      appWindow.minSize = initialSize;
      appWindow.size = initialSize;
      appWindow.alignment = Alignment.center;
      appWindow.show();
    });
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter ScrollView 예제'),
        ),
        body: ListView(
          children: const <Widget>[
            ListTile(
              leading: Icon(Icons.map),
              title: Text('Map'),
            ),
            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text('Album'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
            ),
            // 여기에 더 많은 ListTile 위젯을 추가할 수 있습니다.
          ],
        ),
      ),
    );
  }
}
