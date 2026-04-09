import 'person.dart';
class Teacher extends Person {
  String subject;
  int salary;

  Teacher(
    String id,
    String name,
    int age,
    String gender,
    this.subject,
    this.salary,
  ) : super(id, name, age, gender);

  void displayInfo() {
    print("--- Teacher information ---");
    print("ID: $id");
    print("Name: $name");
    print("Age: $age");
    print("Gender: $gender");
    print("Subject: $subject");
    print("Salary: $salary");
  }
}