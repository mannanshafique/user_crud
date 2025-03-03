import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Constants {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static String currentRoute = '';
  static BuildContext? get c => navigatorKey.currentContext;

  // static String role = UserTpye.driver.name;
  static const emailMaxLength = 35;
  static const zipCodeLength = 7;
  static const nameMaxLength = 30;
  static const addressMaxLength = 50;
  static const descriptionMaxLength = 275;
  static const cvcLength = 3;
  static const accountNumberLength = 16;
  static const passwordMaxLength = 16;
  static const priceMaxLength = 10;

}

//!----Use for provider to access context
class Cn<T> {
  T? get c => Constants.c?.read<T>();
  T? get w => Constants.c?.watch<T>();
}