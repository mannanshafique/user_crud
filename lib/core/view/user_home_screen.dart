import 'package:flutter/material.dart';
import 'package:user_crud/core/model/user_model.dart';
import 'package:user_crud/utils/app_colors.dart';
import 'package:user_crud/utils/app_navigation.dart';
import 'package:user_crud/utils/app_strings.dart';
import 'package:user_crud/utils/routing_arguments.dart';

import '../../routes/app_route.dart';
import '../../utils/app_dialogs.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/no_data_found.dart';
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

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //!- Declare here because 1 if we have more than 1 provider then we use (MultiProvider) after runApp
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.APP_TITLE_TEXT)),
      body: Column(
        children: [
          //! Search Bar
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _searchController,
              onChanged: (query) {
                userProvider.setSearchQuery(query);
              },
              decoration: InputDecoration(
                hintText: 'Search user...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          // user List
          Expanded(
            child: Consumer<UserProvider>(
              builder: (context, provider, child) {
                final users = provider.filteredUsers;

                return RefreshIndicator(
                  onRefresh: () async {
                    fetchUserData();
                  },
                  child: users.isEmpty
                      ? const NoDataFoundWidget()
                      : ListView.builder(
                          itemCount: users.length,
                          itemBuilder: (context, index) {
                            UserData? user = users[index];
                            return ListTile(
                              title: CustomText(
                                text: user.name ?? '',
                              ),
                              subtitle: CustomText(
                                text: user.email ?? '',
                                fontColor: AppColors.lightGrey,
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete,
                                    color: AppColors.lightRed),
                                onPressed: () =>
                                    provider.deleteUser(user.id ?? 0),
                              ),
                              onTap: () {
                                //!---Move to user Detail
                                AppNavigation.navigateTo(
                                  context,
                                  AppRoutes.USER_DETAIL_SCREEN_ROUTE,
                                  arguments:
                                      UserDetailRoutingArgument(userData: user),
                                );
                              },
                            );
                          },
                        ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //!---Move to Add New User
          FocusScope.of(context).unfocus();
          AppNavigation.navigateTo(context, AppRoutes.ADD_USER_SCREEN_ROUTE);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
