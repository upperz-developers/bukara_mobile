import 'dart:convert';

import 'package:bukara/app/providers/user/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPref {
  static SharedPreferences? prefs;
  static const String mobileUserInfo = "userInfo";
}

UserPref getUserInfo() {
  var userInfo = AppPref.prefs?.getString(AppPref.mobileUserInfo) ?? '';
  if (userInfo.isEmpty) {
    return UserPref(
      token: Token(
        token: "",
      ),
    );
  } else {
    var json = jsonDecode(userInfo);
    return UserPref.fromJson(json);
  }
}

void setUserInfo(UserPref userInfo) {
  AppPref.prefs!.setString(
    AppPref.mobileUserInfo,
    jsonEncode(
      userInfo.toJson(),
    ),
  );
}

class UserPref {
  Token? token;
  String? userName;

  UserPref({this.token, this.userName});

  UserPref.fromJson(Map<String, dynamic> json)
      : token = Token.fromJson(json['token']),
        userName = json['useraname'];

  toJson() => {
        "token": token,
        "username": userName,
      };
}
