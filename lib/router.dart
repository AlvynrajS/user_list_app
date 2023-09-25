
import 'package:get/get.dart';
import 'package:sample_list_app/screen/dashboard_scree/dashboard_screen.dart';
import 'package:sample_list_app/screen/user_detail_screen/user_detail_screen.dart';

import 'main.dart';

class AppRoutes {
  static List<GetPage<dynamic>>? routes = [
    GetPage(name: '/', page: () => const SplashScreen()),
    GetPage(name: '/dash_board_screen', page: () => const DashBoardScreen()),
    GetPage(name: '/user_detail_screen', page: () => const UserDetailScreen()),

  ];
}