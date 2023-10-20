import 'package:flutter/material.dart';

import '../../views/views.dart';

class AppRoutes {
  static String initalRoute = "home";
  static Map<String, Widget Function(BuildContext)> routes = {
    "home": (_) => HomeView(),
  };
}
