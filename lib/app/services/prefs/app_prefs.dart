import 'dart:convert';

import 'package:bukara/app/providers/user/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPref {
  static SharedPreferences? prefs;

  static ValueNotifier<UserPerfsInfo> showUserPerf =
      ValueNotifier(UserPerfsInfo());

  static const String mobileUserInfo = "userInfo";
  static const String permanentToken = "permanentToken";
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

// Token getPermanentMobileToken() {
//   var token = AppPref.prefs?.getString(AppPref.permanentToken) ?? '';
//   if (token.isEmpty) {
//     return Token(token: "");
//   } else {
//     var json = jsonDecode(token);
//     return Token.fromJson(json);
//   }
// }

// void setPermanentMobileToken(Token token) {
//   AppPref.prefs!.setString(
//     AppPref.permanentToken,
//     jsonEncode(
//       token.toJson(),
//     ),
//   );
// }

class UserPref {
  Token? token;
  UserPerfsInfo? userPerfsInfo;

  UserPref({this.token, this.userPerfsInfo});

  UserPref.fromJson(Map<String, dynamic> json) {
    token = Token.fromJson(json['token']);
    userPerfsInfo = json['userPerfsInfo'] != null
        ? UserPerfsInfo.fromJson(json['userPerfsInfo'])
        : null;
  }

  toJson() => {
        "token": token,
        "userPerfsInfo": userPerfsInfo?.toJson(),
      };
}

class UserPerfsInfo {
  String? name;
  String? lastname;
  String? countryCode;
  String? phoneNumber;
  String? email;

  UserPerfsInfo(
      {this.name,
      this.lastname,
      this.countryCode,
      this.phoneNumber,
      this.email});

  UserPerfsInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    lastname = json['lastname'];
    countryCode = json['country_code'];
    phoneNumber = json['phone_number'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['lastname'] = lastname;
    data['country_code'] = countryCode;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    return data;
  }
}
