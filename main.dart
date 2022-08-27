import 'dataStudents.dart';
import 'getGroups.dart';

void main() {
  int studentsPerGroup = 2;

  List<List<String>> groups = getGroups(
    studentsPerGroup,
    students,
    dataStudents,
  );

  print("Equipes: " + groups.toString());
  print("Alunos que sobraram: " + students.toString());
}
