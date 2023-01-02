String dayLeft({required String start, required String end}) {
  DateTime startAt = DateTime.parse(start);
  DateTime endAt = DateTime.parse(end);

  int dayLeft = endAt.difference(startAt).inDays;
  return "$dayLeft jours";
}
