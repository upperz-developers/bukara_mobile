class CustomDate {
  final DateTime? date;
  final String? time;
  CustomDate({
    required this.date,
    this.time,
  });
  String? fullDate;

  String get getFullDate =>
      "${getWeekDay().substring(0, 3)} ${date!.day.toString()} ${getMonth().substring(0, 3)} ${date!.year.toString()}";

  String get getFullDateTime =>
      "${getWeekDay()} ${date!.day.toString()} ${getMonth()} ${date!.year.toString()} | $time";

  String getMonth() {
    String month = "";
    switch (date!.month) {
      case 1:
        month = "janvier";
        break;
      case 2:
        month = "fevrier";
        break;
      case 3:
        month = "mars";
        break;
      case 4:
        month = "avril";
        break;
      case 5:
        month = "mai";
        break;
      case 6:
        month = "juin";
        break;
      case 7:
        month = "juillet";
        break;
      case 8:
        month = "aout";
        break;
      case 9:
        month = "septembre";
        break;
      case 10:
        month = "octobre";
        break;
      case 11:
        month = "novembre";
        break;
      case 12:
        month = "decembre";
        break;
      default:
        month = "";
    }
    return month;
  }

  String getWeekDay() {
    String weekday = "";
    switch (date!.weekday) {
      case 1:
        weekday = "Lundi";
        break;
      case 2:
        weekday = "Mardi";
        break;
      case 3:
        weekday = "Mercredi";
        break;
      case 4:
        weekday = "Jeudi";
        break;
      case 5:
        weekday = "Vendredi";
        break;
      case 6:
        weekday = "Samedi";
        break;
      case 7:
        weekday = "Dimanche";
        break;
      default:
        weekday = "";
    }
    return weekday;
  }
}
