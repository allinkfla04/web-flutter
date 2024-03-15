import 'package:flutter/material.dart';
import 'package:web_flutter2/users_repository.dart';

class TambahUsersNotifier extends ChangeNotifier {
  final BuildContext context;
  final Function reload;

  TambahUsersNotifier(this.context, this.reload);

  TextEditingController nama = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();

  final keyForm = GlobalKey<FormState>();

  cek() {
    if (keyForm.currentState!.validate()) {
      simpan();
    }
  }

  var isLoading = false;
  String? error;
  simpan() async {
    isLoading = true;
    notifyListeners();
    UsersRepository.insertUsers(nama.text, phone.text, email.text)
        .then((value) {
      if (value['value'] == 1) {
        isLoading = false;
        reload();
        nama.clear();
        phone.clear();
        email.clear();
        error = value['message'];
        notifyListeners();
      } else {
        isLoading = false;
        error = value['message'];
        notifyListeners();
      }
    });
  }
}
