import 'dataStudents.dart';

bool isInTheSameTeam(String firstStudent, String secondStudent, Map data) {
  bool isIntheSameTeam = false;
  for (int i = 1; i < data.length; i++) {
    dataStudents['ciclo${i}'].forEach((e) {
      if (e.contains(firstStudent) && e.contains(secondStudent)) {
        isIntheSameTeam = true;
      }
    });
  }
  return isIntheSameTeam;
}
