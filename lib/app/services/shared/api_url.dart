// ignore_for_file: constant_identifier_names

class APIURL {
  static const String BASEURL = "https://api-bukara.upper-z.com/api/v1";
  static const String LOGIN = "$BASEURL/users/signin";
  static const String SINGUP = "$BASEURL/users/";
  static const String CHECKMAIL = "$BASEURL/otp";
  static const String SENDCODE = "$BASEURL/otp/token";
  static const String RESETPASSWORD = "$BASEURL/users/reset-psswd/";
  static const String CHANGEPASSWORD = "$BASEURL/users/change/psswd";
  static const String GETAPARTURL = "$BASEURL/appartements/";
  static const String LOGOUT = "$BASEURL/users/logout";
  static const String GETTENANT = "$BASEURL/landlords";
  static const String GETRECOVERYINFO = "$BASEURL/recoveries";
  static const String EDITERUSER = "$BASEURL/users";
  static const String GETCONTRATINFO = "$BASEURL/rental-contrats";
  static const String GETPAYEMENT = "$BASEURL/payments";
}
