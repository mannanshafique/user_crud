import 'package:flutter/material.dart';
import 'package:user_crud/core/model/user_model.dart';
import 'package:user_crud/utils/app_strings.dart';

import '../../widgets/custom_text.dart';

class UserDetailScreen extends StatelessWidget {
  final UserData? userData;
  const UserDetailScreen({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(userData?.name ?? '')),
      body: Card(
        margin: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(
                text: "${AppStrings.USERNAME_TEXT}: ${userData?.username}",
                fontSize: 14,
              ),
              customDivider(),
              CustomText(
                text: "${AppStrings.EMAIL_TEXT}: ${userData?.email}",
                fontSize: 14,
              ),
              customDivider(),
              CustomText(
                text: "${AppStrings.PHONE_TEXT}: ${userData?.phone}",
                fontSize: 14,
              ),
              customDivider(),
              CustomText(
                text: "${AppStrings.WEBSITE_TEXT}: ${userData?.website}",
                fontSize: 14,
              ),
              customDivider(),
              CustomText(
                maxLines: 2,
                textAlign: TextAlign.start,
                text:
                    "${AppStrings.COMPANY_NAME_TEXT}: ${userData?.company?.name}",
                fontSize: 14,
              ),
              customDivider(),
              CustomText(
                maxLines: 2,
                textAlign: TextAlign.start,
                text:
                    "${AppStrings.ADDRESS_TEXT}: ${userData?.address?.suite}, ${userData?.address?.street}, ${userData?.address?.city} ",
                fontSize: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customDivider() {
    return const Column(
      children: [
        SizedBox(height: 3),
        Divider(),
        SizedBox(height: 3),
      ],
    );
  }
}
