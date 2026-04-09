bool isNumber(String input) => RegExp(r'^\d+$').hasMatch(input);

bool isValidName(String name) => RegExp(r'^[a-zA-Z\s]+$').hasMatch(name);

bool isValidClassroomName(String name) => RegExp(r'^[a-zA-Z0-9\s]+$').hasMatch(name);

bool isValidScore(String input) {
  final number = num.tryParse(input);
  return number != null;
}
class Person {
  String id;
  String name;
  int age;
  String gender;

  Person(this.id, this.name, this.age, this.gender);
}