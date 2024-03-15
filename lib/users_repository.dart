import 'dart:convert';
import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:web_flutter2/network/network.dart';

class UsersRepository {
  static Future<dynamic> getUsers() async {
    Dio dio = Dio();
    final response = await dio.get(NetworURL.getUsers());
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(response.data);
      }

      return jsonDecode(response.data);
    } else {
      return jsonDecode(response.data);
    }
  }

  static Future<dynamic> insertUsers(
    String nama,
    String phone,
    String email,
  ) async {
    FormData formData = FormData.fromMap({
      "nama": nama,
      "phone": phone,
      "email": email,
    });
    Dio dio = Dio();
    final response = await dio.post(
      NetworURL.tambahUsers(),
      data: formData,
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.data);
    } else {
      return jsonDecode(response.data);
    }
  }

  static Future<dynamic> update(
    int id,
    String nama,
    String phone,
    String email,
  ) async {
    FormData formData = FormData.fromMap({
      "id": id,
      "nama": nama,
      "phone": phone,
      "email": email,
    });
    Dio dio = Dio();
    final response = await dio.post(
      NetworURL.updateUsers(),
      data: formData,
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.data);
    } else {
      return jsonDecode(response.data);
    }
  }

  static Future<dynamic> delete(
    int id,
  ) async {
    FormData formData = FormData.fromMap({
      "id": id,
    });
    Dio dio = Dio();
    final response = await dio.post(
      NetworURL.deleteUsers(),
      data: formData,
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.data);
    } else {
      return jsonDecode(response.data);
    }
  }
}
