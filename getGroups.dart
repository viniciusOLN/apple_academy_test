import 'isInTheSameTeam.dart';

/* Função que percorre o vetor de alunos, verifica se já fizeram equipe em
ciclos anteriores e salvam os mesmos em um time. Ao final da função, o algoritmo
retorna uma lista de listas, onde cada lista é uma equipe com a quantidade de
alunos que podem fazer equipe.
*/

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

    /*verifica se todos os nomes que estão dentro de sameGroup já fizeram grupo
     em algum ciclo anterior */

    bool isAllInSameTeam = sameGroup.any((e) => isInTheSameTeam(e, next, data));

    if (isAllInSameTeam) {
      nextStudent++;
      continue;
    }

    sameGroup.add(next);

    if (sameGroup.length == limit) {
      //retira os nomes já comparados da lista de estudantes
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

/* roda a função getTeams N vezes, onde cada vez que retorna os grupos formados
é adicionado na variável finalGroups que é repassada ao final da execução. */

List<List<String>> getGroups(int limit, List<String> students, Map data) {
  List<List<String>> finalGroups = [];

  for (int i = limit; i != 1; i--) {
    List<List<String>> groupsFormated = _getTeams(i, students, data);

    /* transforma a lista de estudantes(students) em uma nova, sem todos os nomes
      que já fizeram equipe */

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
