import 'package:flutter/material.dart';
import 'package:user_crud/core/view/add_user_screen.dart';

import '../core/view/user_detail_screen.dart';
import '../core/view/user_home_screen.dart';
import '../utils/routing_arguments.dart';
import 'app_route.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (BuildContext context) {
        switch (routeSettings.name) {
          case AppRoutes.USER_HOME_SCREEN_ROUTE:
            return const HomeScreen();
          case AppRoutes.USER_DETAIL_SCREEN_ROUTE:
            UserDetailRoutingArgument? userDetailRoutingArgument =
                routeSettings.arguments as UserDetailRoutingArgument?;
            return UserDetailScreen(
              userData: userDetailRoutingArgument?.userData,
            );
          case AppRoutes.ADD_USER_SCREEN_ROUTE:
            return const AddNewUserScreen();
          default:
            return Container();
        }
      },
    );
  }
}
