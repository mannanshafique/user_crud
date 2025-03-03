import 'package:flutter/material.dart';
import 'package:user_crud/core/model/user_model.dart';

class UserProvider extends ChangeNotifier {
  final List<UserData> _users = [];

  List<UserData> get users => _users;

  void clearUserDataList() {
    _users.clear();
    notifyListeners();
  }

  void addDataInUserList({required UserData userData}) {
    _users.add(userData);
    notifyListeners();
  }

  void deleteUser(int id) {
    _users.removeWhere((user) => user.id == id);
    notifyListeners();
  }

  void addRandomUser() {
    final randomUser = UserData(
      id: DateTime.now().millisecondsSinceEpoch,
      name: "Random User ${_users.length + 1}",
      email: "random${_users.length + 1}@example.com",
      phone: "123-456-7890",
    );
    _users.add(randomUser);
    notifyListeners();
  }
}
