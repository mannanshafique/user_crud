import 'package:flutter/material.dart';
import 'package:user_crud/core/model/user_model.dart';
import 'package:user_crud/utils/app_colors.dart';
import 'package:user_crud/utils/app_strings.dart';

import '../../utils/app_dialogs.dart';
import '../bloc/user_bloc.dart';
import '../controller/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      fetchUserData();
    });
    super.initState();
  }

  fetchUserData() {
    UserBloc().getUserData(
        context: context,
        setProgressBar: () {
          AppDialogs.progressAlertDialog(context: context);
        });
  }

  @override
  Widget build(BuildContext context) {
    //!- Declare here because 1 if we have more than 1 provider then we use (MultiProvider) after runApp
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.APP_TITLE_TEXT)),
      body: RefreshIndicator(
        onRefresh: () async {
          fetchUserData();
        },
        child: userProvider.users.isEmpty
            ? noDataFoundWidget()
            : ListView.builder(
                itemCount: userProvider.users.length,
                itemBuilder: (context, index) {
                  UserData? user = userProvider.users[index];
                  return ListTile(
                    title: Text(user.name ?? ''),
                    subtitle: Text(user.email ?? ''),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: AppColors.lightRed),
                      onPressed: () => userProvider.deleteUser(user.id ?? 0),
                    ),
                    onTap: () {},
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: userProvider.addRandomUser,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget noDataFoundWidget() {
    return SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: const Center(
              child: Text(
                AppStrings.NO_DATA_FOUND_TEXT,
              ),
            )));
  }
}
