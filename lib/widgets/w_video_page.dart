import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_app/widgets/w_video_player.dart';

class VideoPage extends ConsumerStatefulWidget {
  const VideoPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VideoPageState();
}

class _VideoPageState extends ConsumerState<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return const VideoPlayer();
  }
}
