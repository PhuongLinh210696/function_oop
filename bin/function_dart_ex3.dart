import 'dart:io';

void main() {
  CourseManagement courseManagement = new CourseManagement();
  courseManagement.start();
}

class Course{
  String code;
  String name;
  double duration;
  String status;
  String flag;

  Course({
    required this.code,
    required this.name,
    required this.duration,
    required this.status,
    required this.flag,
  });
  void input(){
    do{
      print('Enter code:');
      code = stdin.readLineSync()!;
    }while(code.length > 5 || !code.startsWith('FW') || checkDuplicate(code.substring(2)));
   
    print('Enter name:');
    name = stdin.readLineSync()!;

    print('Enter duration:');
    duration = double.parse(stdin.readLineSync()!);

    do{
      print('Enter status:');
      status = stdin.readLineSync()!;
    }while(status != 'active' && status !='in-active');

    do{
      print('Enter flag:');
      flag = stdin.readLineSync()!;
    }while(flag != 'optional' && flag != 'mandatory' && flag != 'N/A');
    
  }

  void output(){
    print('${code},${name},${duration},${status},${flag}');
  }
}

class CourseManagement{
  List<Course> courses = [];

  void inputCourse() {
    Course course = Course(
      code: '',
      name: '',
      duration: 0.0,
      status: '',
      flag: '',
    );
    course.input();
    courses.add(course);
  }

  void displayOptionalCourses() {
    for (var course in courses) {
      if (course.flag == 'optional') {
        course.output();
        print('----------');
      }
    }
  }

  void find(String type, dynamic data) {
    for (var course in courses) {
      if ((type == 'code' && course.code == data) ||
          (type == 'name' && course.name == data) ||
          (type == 'duration' && course.duration == data) ||
          (type == 'status' && course.status == data) ||
          (type == 'flag' && course.flag == data)) {
        course.output();
        print('----------');
      }
    }
  }

  void start() {
    while (true) {
      print('Select a function:');
      print('1. Input course');
      print('2. Display all courses that flag is "optional"');
      print('3. Search courses');
      print('4. Quit');
      stdout.write('Enter your choice: ');
      String? choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          inputCourse();
          break;
        case '2':
          displayOptionalCourses();
          break;
        case '3':
          stdout.write('Enter attribute to search by (code, name, duration, status, flag): ');
          String? type = stdin.readLineSync();
          if (type != null) {
            stdout.write('Enter value to search for: ');
            String? data = stdin.readLineSync();
            if (data != null) {
              if (type == 'duration') {
                find(type, double.parse(data));
              } else {
                find(type, data);
              }
            }
          }
          break;
        case '4':
          return;
        default:
          print('Invalid choice. Please select a valid option.');
      }
    }
  }
}

bool checkDuplicate(String n){
  List splitnums = n.split('').toList(); 
  List removeDuplicate = splitnums.toSet().toList();

  if(removeDuplicate.length < splitnums.length){
    return true;
  }else{
    return false;
  }
}