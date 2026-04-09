import 'classroom.dart';
import 'dart:io';
import 'teacher.dart';
import 'person.dart';
import 'student.dart';
class SchoolManagement {
  List<Classroom> classrooms = [];
  List<Teacher> teachers = [];

  void addTeacher(Teacher teacher) {
    teachers.add(teacher);
  }
  void addClassroom(Classroom classroom) {
    classrooms.add(classroom);
  }

  bool isStudentIdExists(String id) {
    for (var classroom in classrooms) {
      if (classroom.isStudentIdExists(id)) {
        return true;
      }
    }
    return false;
  }

  bool isTeacherIdExists(String id) {
    return teachers.any((teacher) => teacher.id == id);
  }

  bool isClassroomIdExists(String id) {
    return classrooms.any((classroom) => classroom.id == id);
  }

  Classroom? getClassroomById(String id) {
  try {
    return classrooms.firstWhere((classroom) => classroom.id == id);
  } 
  catch (e) {
    return null;
  }
}

  void showAllClasses() {
    if (classrooms.isEmpty) {
      print("No classes available.");
    } 
    else 
    {
      for (var classroom in classrooms) 
      {
        classroom.displayClassInfo();
      }
    }
  }

  void showAllTeachers() {
    if (teachers.isEmpty) {
      print("No teachers available.");
    } 
    else 
    { 
      print("Display the list of teachers:");
      for (var teacher in teachers) {
        teacher.displayInfo();
      }
    }
  }

  void showAllStudents() {
    bool hasStudents = false;  // Biến kiểm tra nếu có học sinh
    for (var classroom in classrooms) {
      if (classroom.students.isNotEmpty) {
        if (!hasStudents) {
          print("Display the list of students:");
          hasStudents = true;
          for (var student in classroom.students) {
            student.displayInfo();  // Hiển thị thông tin từng học sinh
          }
        }
      }
    }

    if (!hasStudents) {
      print("No students available.");
    }
  }
}
void calculateClassAverageFromMenu(SchoolManagement schoolManagement) {
  String idInput = "";
  while (true) 
  {
    print("Enter Classroom's ID to calculate the average score:");
    idInput = stdin.readLineSync() ?? "";
    if (isNumber(idInput)) 
    {
      break;
    } 
    else 
    {
      print("The number you just entered is not a number. Please re-enter.");
    }
  }
  

  var classroom = schoolManagement.getClassroomById(idInput);
  if (classroom == null) {
    print("Class with ID $idInput not found.");
  } else {
    print("Class with ID $idInput found.");

    print("Class Name: ${classroom.name}");
    print("Class Average Score: ${calculateAverageScore(classroom)}");
  }
}

double calculateAverageScore(Classroom classroom) {
  if (classroom.students.isEmpty) 
    return 0;
  double total = 0;
  for (var student in classroom.students) {
    total += student.score;
  }
  return double.parse((total / classroom.students.length).toStringAsFixed(1));
}

Teacher createTeacher(SchoolManagement schoolManagement) {
  String idInput = "";
  while (true) 
  {
    print("Enter Teacher's ID:");
    idInput = stdin.readLineSync() ?? "";
    if (isNumber(idInput)) 
    {
      if (schoolManagement.isTeacherIdExists(idInput)) {
        print("Teacher ID already exists. Please enter a different ID.");
      } 
      else if (schoolManagement.isStudentIdExists(idInput)) {
        print("Student ID already exists. Please enter a different ID.");
      } 
      else if (schoolManagement.isClassroomIdExists(idInput)) {
        print("Classroom ID already exists. Please enter a different ID.");
      } 
      else {
        break;  // ID hợp lệ, thoát vòng lặp
      }
    } 
    else 
    {
      print("The number you just entered is not a number. Please re-enter.");
    }
  }
  String name = "";
  while(true)
  {
    print("Enter Teacher's Name:");
    name = stdin.readLineSync()!.replaceAll(RegExp(r'\s+'), ' ').trim().toLowerCase();
    if(isValidName(name))
      break;
    else
      print("Invalid name. Please re-enter.");
  }
  
  String ageInput = "";
  int age = -1;
  while (true) 
  {
    print("Enter Teacher's Age:");
    ageInput = stdin.readLineSync() ?? "";
    if (isNumber(ageInput)) 
    {
      age = int.parse(ageInput);
      break;
    } 
    else 
    {
      print("The number you just entered is not a number. Please re-enter.");
    }
  }

  String gender = "";
  while (true) 
  {
    print("Enter Student's Gender (m for male, f for female):");
    gender = stdin.readLineSync()!.replaceAll(RegExp(r'\s+'), ' ').trim().toLowerCase();
    
    if (gender == 'm') 
    {
      gender = 'male';
      break;
    } 
    else if (gender == 'f')
    {
      gender = 'female';
      break;
    } 
    else {
      print("Invalid input. Please enter 'm' for male or 'f' for female.");
    }
  }

  String subject = "";
  while(true)
  {
    print("Enter Teacher's Subject:");
    subject = stdin.readLineSync()!.replaceAll(RegExp(r'\s+'), ' ').trim().toLowerCase();
    if(isValidName(subject))
      break;
    else
      print("Invalid input. Please re-enter.");
  }

  String salaryInput = "";
  int salary = -1;
  while (true) 
  {
    print("Enter Teacher's Salary:");    
    salaryInput = stdin.readLineSync() ?? "";
    if (isNumber(salaryInput)) {
      salary = int.parse(salaryInput);
      break;
    } else {
      print("Invalid salary. Please re-enter.");
    }
  }

  return Teacher(idInput, name, age, gender, subject, salary);
}


Student createStudent(SchoolManagement schoolManagement, Classroom classroom) {
  String idInput = "";
  while (true) 
  {
    print("Enter Student's ID:");
    idInput = stdin.readLineSync() ?? "";
    if (isNumber(idInput)) 
    {
      if (schoolManagement.isTeacherIdExists(idInput)) {
        print("Teacher ID already exists. Please enter a different ID.");
      } 
      else if (schoolManagement.isStudentIdExists(idInput)) {
        print("Student ID already exists. Please enter a different ID.");
      } 
      else if (schoolManagement.isClassroomIdExists(idInput)) {
        print("Classroom ID already exists. Please enter a different ID.");
      } 
      else {
        break;  // ID hợp lệ, thoát vòng lặp
      }
    } 
    else 
    {
      print("The number you just entered is not a number. Please re-enter.");
    }
  }
  
  String name = "";
  while(true)
  {
    print("Enter Student's Name:");
    name = stdin.readLineSync()!.replaceAll(RegExp(r'\s+'), ' ').trim().toLowerCase();
    if(isValidName(name))
      break;
    else
      print("Invalid name. Please re-enter.");
  }
  
  String ageInput = "";
  int age = -1;
  while (true) 
  {
    print("Enter Student's Age:");
    ageInput = stdin.readLineSync() ?? "";
    if (isNumber(ageInput)) 
    {
      age = int.parse(ageInput);
      break;
    } 
    else 
    {
      print("The number you just entered is not a number. Please re-enter.");
    }
  }
  
  String gender = "";
  while (true) 
  {
    print("Enter Student's Gender (m for male, f for female):");
    gender = stdin.readLineSync()!.replaceAll(RegExp(r'\s+'), ' ').trim().toLowerCase();
    
    if (gender == 'm') 
    {
      gender = 'male';
      break;
    } 
    else if (gender == 'f')
    {
      gender = 'female';
      break;
    } 
    else {
      print("Invalid input. Please enter 'm' for male or 'f' for female.");
    }
  }

  String scoreInput = "";
  double score = -1;
  while (true) 
  {
    print("Enter Student's Score:");
    scoreInput = stdin.readLineSync() ?? "";
    if (isValidScore(scoreInput)) 
    {
      score = double.parse(double.parse(scoreInput).toStringAsFixed(1));
      if(score  >=0 && score <= 10)
        break;
      else
        print("Invalid score");
    } 
    else {
      print("The number you just entered is not a number. Please re-enter.");
    }
  }

  return Student(idInput, name, age, gender, classroom.name, score);
}

Classroom createClassroom(SchoolManagement schoolManagement) {
  String idInput = "";
  while (true) 
  {
    print("Enter Classroom's ID:");
    idInput = stdin.readLineSync() ?? "";
    if (isNumber(idInput)) 
    {
      if (schoolManagement.isTeacherIdExists(idInput)) {
        print("Teacher ID already exists. Please enter a different ID.");
      } 
      else if (schoolManagement.isStudentIdExists(idInput)) {
        print("Student ID already exists. Please enter a different ID.");
      } 
      else {
        break;  // ID hợp lệ, thoát vòng lặp
      }
    } 
    else 
    {
      print("The number you just entered is not a number. Please re-enter.");
    }
  }
  if(schoolManagement.classrooms.isNotEmpty)
  {
    var existingClass = schoolManagement.getClassroomById(idInput);
    if (existingClass != null) {
      print("Class with ID $idInput already exists.");
      bool addMoreStudents = true;
      while (addMoreStudents) 
      {
        print("Do you want to add a student to the class? (y/n)");
        String choice = stdin.readLineSync()!.replaceAll(RegExp(r'\s+'), ' ').trim().toLowerCase();
        if (choice == 'y') 
        {
          int addStudent = -1;
          String addInputStudent = "";
          while(true)
          {
            print("How many student do you want to add");
            addInputStudent = stdin.readLineSync() ?? "";
            if(isNumber(addInputStudent))
            {
              addStudent = int.parse(addInputStudent);
              break;
            }
            else 
            {
              print("The number you just entered is not a number. Please re-enter.");
            }
          }
          for(int i = 0; i<addStudent;i++)
          {
            var student = createStudent(schoolManagement, existingClass);
            existingClass.addStudent(student);
          }
        } 
        else {
          addMoreStudents = false;
        }
      }
      return existingClass;  
    }
  }

  String name = "";
  while(true)
  {
    print("Enter Classroom Name:");
    name = stdin.readLineSync()!.replaceAll(RegExp(r'\s+'), ' ').trim();
    if(isValidClassroomName(name))
      break;
    else
      print("Invalid name. Please re-enter.");
  }
  
  var classroom = Classroom(idInput, name);
  schoolManagement.addClassroom(classroom);

  print("Add teacher");
  Teacher teacher = createTeacher(schoolManagement);
  classroom.assignTeacher(teacher);
  schoolManagement.addTeacher(teacher);

  print("Add students");
  int add = -1;
  String addInput = "";
  while(true)
  {
    print("How many student do you want to add");
    addInput = stdin.readLineSync() ?? "";
    if(isNumber(addInput))
    {
      add = int.parse(addInput);
      break;
    }
    else 
    {
      print("The number you just entered is not a number. Please re-enter.");
    }
  }
  for(int i = 0; i<add;i++)
  {
    var student = createStudent(schoolManagement, classroom);
    classroom.addStudent(student);
  }
  
  return classroom;
}
