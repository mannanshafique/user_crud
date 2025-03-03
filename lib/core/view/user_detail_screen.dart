import 'package:flutter/material.dart';
import 'package:user_crud/core/model/user_model.dart';
import 'package:user_crud/utils/app_strings.dart';

class UserDetailScreen extends StatelessWidget {
  final UserData? userData;
  const UserDetailScreen({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(userData?.name ?? '')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${AppStrings.EMAIL_TEXT}: ${userData?.email}",
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("${AppStrings.PHONE_TEXT}: ${userData?.phone}",
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text("${AppStrings.ADDRESS_TEXT}: ${userData?.address}",
                style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
