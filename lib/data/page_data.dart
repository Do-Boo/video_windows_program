import 'package:flutter/material.dart';
import 'package:video_app/model/page_model.dart';
import 'package:video_app/widgets/w_home_page.dart';
import 'package:video_app/widgets/w_video_page.dart';

class PageData {
  final menu = <PageNameModel>[
    PageNameModel(title: "Home", page: const MainPage()),
    PageNameModel(title: "Video", page: const VideoPage()),
    PageNameModel(title: "clean", page: const Placeholder()),
    PageNameModel(title: "bakery", page: const Placeholder()),
    PageNameModel(title: "palette", page: const Placeholder()),
  ];
}
