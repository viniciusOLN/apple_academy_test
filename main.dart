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
    for (int i = 1; i < dataStudents.length + 1; i++) {
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

  int quantStudentsPerTeam = 2;
  List<String> sameTeam = [];
  while (nextStudent < students.length) {
    String current = students[currentStudent];
    String next = students[nextStudent];

    if (sameTeam.length == 0) {
      sameTeam.add(current);
    }

    bool anyStudentInSameTeam = sameTeam.any((e) => isInTheSameTeam(e, next));

    if (isInTheSameTeam(current, next) || anyStudentInSameTeam) {
      nextStudent++;
      continue;
    }

    sameTeam.add(next);
    if (sameTeam.length == quantStudentsPerTeam) {
      students =
          students.where((student) => !sameTeam.contains(student)).toList();
      resultTeam.add([...sameTeam]);
      sameTeam.clear();
      currentStudent = 0;
      nextStudent = currentStudent + 1;
    }
  }

  print(resultTeam);
  print(students.length);
}
