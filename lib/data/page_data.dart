import 'package:video_app/model/page_model.dart';
import 'package:video_app/widgets/w_home_page.dart';
import 'package:video_app/widgets/w_video_page.dart';

class PageData {
  final menu = <PageNameModel>[
    PageNameModel(name: "MainPage", page: const MainPage()),
    PageNameModel(name: "VideoPage", page: const VideoPage()),
  ];
}
