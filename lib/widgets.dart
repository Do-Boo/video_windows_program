import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'MediaKit Playlist Example',
      home: VideoPlaylistScreen(),
    );
  }
}

class VideoPlaylistScreen extends StatefulWidget {
  const VideoPlaylistScreen({super.key});

  @override
  _VideoPlaylistScreenState createState() => _VideoPlaylistScreenState();
}

class _VideoPlaylistScreenState extends State<VideoPlaylistScreen> {
  late Player player;
  late Playlist playlist;
  late VideoController videoController;

  @override
  void initState() {
    super.initState();
    player = Player();
    videoController = VideoController(player);

    // 비디오 파일 목록을 생성하세요.
    var mediaList = [
      Media('assets/videos/test.mp4'),
      Media('assets/videos/test.mp4'),
      Media('assets/videos/test.mp4'),
    ];
    playlist = Playlist(mediaList);

    // 첫 번째 비디오를 재생합니다.
    player.open(playlist.medias.first);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MediaKit Playlist Example'),
      ),
      body: Center(
        child: Video(
          controller: videoController,
          aspectRatio: 16 / 9,
          fit: BoxFit.contain,
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => player.previous(),
            tooltip: 'Previous Video',
            child: const Icon(Icons.skip_previous),
          ),
          const SizedBox(width: 8),
          FloatingActionButton(
            onPressed: () => player.next(),
            tooltip: 'Next Video',
            child: const Icon(Icons.skip_next),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Player>('player', player));
  }
}
