import 'teacher.dart';
import 'student.dart';
class Classroom {
  String id;
  String name;
  List<Student> students = [];
  Teacher? teacher;

  Classroom(this.id, this.name);

  void addStudent(Student student) {
    students.add(student);
    print('${student.name} has been added to class $name');
  }

  void assignTeacher(Teacher teacher) {
    this.teacher = teacher;
    print('Teacher ${teacher.name} has been added to class $name');
  }

  bool isStudentIdExists(String id) {
    return students.any((student) => student.id == id);
  }

  void displayClassInfo() {
    print("\n=== Class information ===");
    print("Class ID: $id");
    print("Class name: $name");
    print("Teacher in charge: ${teacher != null ? teacher!.name : "No"}");
    if(students.isEmpty)
    {
      print("There are no students at the moment.");
    }
    else
    {
      print("Danh sach hoc sinh:");
      for (var student in students) {
        print("- Name: ${student.name} | Class: ${student.grade} | Point: ${student.score}");
      }
    }
    
  }
}