import 'package:amaazon/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  Users _user = Users(
    id: '',
    name: '',
    email: '',
    password: '',
    address: '',
    type: '',
    token: '',
  );

  Users get user => _user;

  void setUser(String user) {
    _user = Users.fromJson(user);
    notifyListeners();
  }
}
