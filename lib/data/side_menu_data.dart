import 'package:flutter/material.dart';
import 'package:video_app/model/side_menu_model.dart';

class SideMenuData {
  final menu = <SideMenuModel>[
    SideMenuModel(icon: Icons.home, title: "Home"),
    SideMenuModel(icon: Icons.abc, title: "Video"),
    SideMenuModel(icon: Icons.clean_hands, title: "clean"),
    SideMenuModel(icon: Icons.bakery_dining, title: "bakery"),
    SideMenuModel(icon: Icons.palette_sharp, title: "palette"),
  ];
}
