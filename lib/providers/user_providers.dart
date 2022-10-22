import 'package:flutter/cupertino.dart';
import 'package:instagram_flutter/models/user.dart';
import 'package:instagram_flutter/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  AuthMethods _authMethods = AuthMethods();

  User get getUser => _user!;

  Future<void> refreshUser() async {

    // getin user detail from authmethod class function setting it to..
    // ...user and setting user to global variable of the class _user.
    User user = await _authMethods.getUserDetails();
    _user = user;
    // notifylistener is function from provider that with send data to all the listeners in the application.
    notifyListeners();
  }
}
