import 'package:flutter/material.dart';
import 'package:web_flutter2/models/index.dart';
import 'package:web_flutter2/users_repository.dart';

class UsersNotifier extends ChangeNotifier {
  final BuildContext context;

  UsersNotifier(this.context) {
    getUsers();
  }
  var isLoading = true;
  List<UsersModel> list = [];
  getUsers() async {
    isLoading = true;
    list.clear();
    notifyListeners();
    UsersRepository.getUsers().then((value) {
      for (Map<String, dynamic> i in value['users']) {
        list.add(UsersModel.fromJson(i));
      }
      isLoading = false;
      notifyListeners();
    });
  }
}
