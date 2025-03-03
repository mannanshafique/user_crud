import 'package:flutter/material.dart';
import 'package:user_crud/core/model/user_model.dart';

class UserProvider extends ChangeNotifier {
  final List<UserData> _users = [];
  String _searchQuery = '';

  List<UserData> get users => _users;

  // Filtered list based on search query
  List<UserData> get filteredUsers => _users
      .where((user) =>
          user.name!.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          user.email!.toLowerCase().contains(_searchQuery.toLowerCase()))
      .toList();

  String get searchQuery => _searchQuery;

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void clearUserDataList() {
    _users.clear();
    notifyListeners();
  }

  void addDataInUserList({required UserData userData, bool? isInsert}) {
    if (isInsert ?? false) {
      _users.insert(0, userData);
    } else {
      _users.add(userData);
    }
    notifyListeners();
  }

  void deleteUser(int id) {
    _users.removeWhere((user) => user.id == id);
    notifyListeners();
  }
}
