import 'package:ink_kink/backend/models.dart';

class UserDB {
  static final UserDB _singleton = new UserDB._internal();

  factory UserDB() {
    return _singleton;
  }

  UserDB._internal() {
    List<User> users = new List();
  };

// }