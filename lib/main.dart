import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_crud/core/view/user_home_screen.dart';
import 'package:user_crud/utils/app_colors.dart';

import 'core/controller/user_provider.dart';
import 'utils/constant.dart';

//! 3.16.3 ===>Flutter SDK

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: MaterialApp(
          navigatorKey: Constants.navigatorKey,
          title: 'User CRUD',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.darkBlue),
            useMaterial3: false,
          ),
          home: const HomeScreen()),
    );
  }
}
