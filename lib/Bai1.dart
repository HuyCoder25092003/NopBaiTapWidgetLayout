import 'dart:io';
import 'person.dart';
import 'schoolManagement.dart';
void main() {
  var schoolManagement = SchoolManagement();
  bool exit = false;

  while (!exit) 
  {
    print("\n*** School Management System ***");
    print("1. Student and education management");
    print("2. Calculate the average score of the students.");
    print("3. Assign teachers and students to classrooms.");
    print("4. Display class list report");
    print("5. Exit");
    
    String idInput = "";
    int choice = -1;
    while (true) 
    {
      print("Enter your choice:");
      idInput = stdin.readLineSync() ?? "";
      if (isNumber(idInput)) 
      {
        choice = int.parse(idInput);
        break;
      } 
      else 
      {
        print("The number you just entered is not a number. Please re-enter.");
      }
    }

    switch (choice) 
    {
      case 1:
        schoolManagement.showAllTeachers();
        schoolManagement.showAllStudents();
        break;
      case 2:
        calculateClassAverageFromMenu(schoolManagement);
        break;
      case 3:
        var classroom = createClassroom(schoolManagement);
        print("Created the class ${classroom.name} and assigned teachers and students..");
        break;
      case 4:
        schoolManagement.showAllClasses();
        break;
      case 5:
        exit = true;
        break;
      default:
        print("Invalid choice, please try again.");
        break;
    }
  }
}