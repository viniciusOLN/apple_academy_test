void main() {
  Map<String, dynamic> dataStudents = {
    "ciclo1": [
      ["Laura", "Pedro", "João", "Vinicius"],
      ["Carlos", "Maria", "Leonardo", "Ana"],
      ["Daniela", "Marcos", "Wesley", "Luiza"],
      ["Daiane", "Felipe", "Teodoro", "Helena"],
      ["Natalia", "Beatriz", "Eduardo", "Caio"]
    ],
    "ciclo2": [
      ["Teodoro", "Daiane", "Luiza"],
      ["Carlos", "João", "Helena"],
      ["Daniela", "Pedro", "Caio"],
      ["Leonardo", "Maria", "Laura"],
      ["Beatriz", "Marcos", "Vinicius"],
      ["Natalia", "Felipe", "Eduardo"],
      ["Ana", "Wesley"]
    ]
  };

  List<List<String>> resultTeam = [];

  bool isInTheSameTeam(String firstStudent, String secondStudent) {
    bool isIntheSameTeam = false;
    for (int i = 1; i < dataStudents.length; i++) {
      dataStudents['ciclo${i}'].forEach((e) {
        if (e.contains(firstStudent) && e.contains(secondStudent)) {
          isIntheSameTeam = true;
        }
      });
    }
    return isIntheSameTeam;
  }

  int currentStudent = 0;
  int nextStudent = 1;
  List<String> students = [
    "Laura",
    "Pedro",
    "João",
    "Vinicius",
    "Carlos",
    "Maria",
    "Leonardo",
    "Ana",
    "Daniela",
    "Marcos",
    "Wesley",
    "Luiza",
    "Daiane",
    "Felipe",
    "Teodoro",
    "Helena",
    "Natalia",
    "Beatriz",
    "Eduardo",
    "Caio",
  ];

  int quantStudentsPerTeam = 3;
  List<String> sameGroup = [];
  while (nextStudent < students.length) {
    String current = students[currentStudent];
    String next = students[nextStudent];

    if (sameGroup.length == 0) {
      sameGroup.add(current);
    }

    if (sameGroup.any((e) => isInTheSameTeam(e, next)) ||
        sameGroup.contains(current) && sameGroup.contains(next)) {
      nextStudent++;
      continue;
    }

    sameGroup.add(next);

    if (sameGroup.length == quantStudentsPerTeam) {
      students = students.where((student) {
        return !sameGroup.contains(student);
      }).toList();

      resultTeam.add([...sameGroup]);
      sameGroup.clear();
      currentStudent = 0;
      nextStudent = currentStudent + 1;
    }
  }

  print(resultTeam);
  print(students.length);
}
