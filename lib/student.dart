import 'person.dart';
class Student extends Person {
  String grade;
  double score;

  Student(
    String id,
    String name,
    int age,
    String gender,
    this.grade,
    this.score,
  ) : super(id, name, age, gender);

  void displayInfo() {
    print("--- Student Information ---");
    print("ID: $id");
    print("Name: $name");
    print("Age: $age");
    print("Gender: $gender");
    print("Grade: $grade");
    print("Score: $score");
  }
}
