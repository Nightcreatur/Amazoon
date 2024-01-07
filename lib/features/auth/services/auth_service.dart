import 'dart:convert';
import 'package:amaazon/constants/error_handler.dart';
import 'package:amaazon/constants/global_variables.dart';
import 'package:amaazon/constants/utils.dart';
import 'package:amaazon/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  void signup(
      {required String name,
      required String email,
      required String password,
      required BuildContext context}) async {
    try {
      Users user = Users(
        id: '',
        name: name,
        password: password,
        address: '',
        type: '',
        token: '',
        email: email,
      );
      http.Response res = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      if (context.mounted) {
        httpErrorHandler(
            context: context,
            response: res,
            onSuccess: () {
              showSnackBar(context,
                  'Account created successfully!, Login with same credintials');
            });
      }
    } catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.toString());
      }
    }
  }

  void signIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      http.Response res = await http.post(Uri.parse('$uri/api/signin'),
          body: jsonEncode({
            'email': email,
            'password': password,
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      print(res.body);

      if (context.mounted) {
        httpErrorHandler(
          context: context,
          response: res,
          onSuccess: () async {
            SharedPreferences pref = await SharedPreferences.getInstance();
            await pref.setString(
              'x-auth-token',
              jsonDecode(res.body)['token'],
            );
          },
        );
      }
    } catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.toString());
      }
    }
  }
}
