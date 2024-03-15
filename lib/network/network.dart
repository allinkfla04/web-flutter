import 'dart:html';

const url = "http://localhost/workshop_flutter2/api";

class NetworURL {
  static String tambahUsers() {
    return "$url/insert.php";
  }

  static String getUsers() {
    return "$url/get_users.php";
  }

  static String updateUsers() {
    return "$url/update_users.php";
  }

  static String deleteUsers() {
    return "$url/delete_users.php";
  }
}
