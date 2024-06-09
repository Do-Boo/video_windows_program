import "dart:io" show Platform;
import "package:bitsdojo_window/bitsdojo_window.dart";
import "package:flutter/foundation.dart" show kIsWeb;
import "package:flutter/material.dart";
import "package:flutter/services.dart";
// Make sure to add following packages to pubspec.yaml:
// * media_kit
// * media_kit_video
// * media_kit_libs_video
import "package:media_kit/media_kit.dart"; // Provides [Player], [Media], [Playlist] etc.
import "package:media_kit_video/media_kit_video.dart"; // Provides [VideoController] & [Video] etc.

class PlatformSpecificCode {
  static const MethodChannel _channel = MethodChannel("com.example.videoApp");

  static Future<String> getNativeData() async {
    final String result = await _channel.invokeMethod("getNativeData");
    return result;
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();
  runApp(
    const MaterialApp(
      home: MyScreen(),
    ),
  );
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

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  late final Player player = Player();
  late final VideoController controller = VideoController(player);

  @override
  void initState() {
    super.initState();
    player.open(Media("https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"));
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Use [Video] widget to display video output.
        child: Video(controller: controller),
      ),
    );
  }
}
