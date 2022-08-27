import 'isInTheSameTeam.dart';

List<List<String>> _getTeams(int limit, List<String> students, Map data) {
  List<String> sameGroup = [];
  List<List<String>> resultTeam = [];
  int currentStudent = 0;
  int nextStudent = 1;

  while (nextStudent < students.length) {
    String current = students[currentStudent];
    String next = students[nextStudent];

    if (sameGroup.length == 0) {
      sameGroup.add(current);
    }

    bool isAllInSameTeam = sameGroup.any((e) => isInTheSameTeam(e, next, data));

    if (isAllInSameTeam) {
      nextStudent++;
      continue;
    }

    sameGroup.add(next);

    if (sameGroup.length == limit) {
      students = students.where((student) {
        return !sameGroup.contains(student);
      }).toList();

      resultTeam.add([...sameGroup]);
      sameGroup.clear();
      currentStudent = 0;
      nextStudent = currentStudent + 1;
    }
  }
  return resultTeam;
}

List<List<String>> getGroups(int limit, List<String> students, Map data) {
  List<List<String>> finalGroups = [];

  for (int i = limit; i != 1; i--) {
    List<List<String>> groupsFormated = _getTeams(i, students, data);

    groupsFormated.forEach(
      (row) => row.forEach(
        (studentAtRow) => students.removeWhere(
          (student) => student == studentAtRow,
        ),
      ),
    );

    groupsFormated.forEach((row) => finalGroups.add(row));
  }

  return finalGroups;
}
