import 'dart:io';

class OpenElective {

  final String courseName, courseCode;
  OpenElective(this.courseName, this.courseCode);
}

class BranchElective extends OpenElective{
  String branch;
  int year;

  BranchElective(this.branch, this.year, courseName, courseCode) : super(courseName, courseCode);
}

void main(){
  List<OpenElective> arr1 = [];
  List<BranchElective> arr2 = [];

  int op;
  while(true) {
    print("Enter type of user 1.Admin 2.Student 3.Exit");
    op = int.parse(stdin.readLineSync().toString());
    switch (op) {
      case 1:
        {
          print("Enter course type 1.Open Elective 2. Branch Elective");
          int op2 = int.parse(stdin.readLineSync().toString());
          switch (op2) {
            case 1:
              {
                print("Enter course name and code");
                String cname = stdin.readLineSync().toString();
                String ccode = stdin.readLineSync().toString();
                arr1.add(OpenElective(cname, ccode));
                break;
              }
            case 2:
              {
                print("Enter branch, year, course name and code");
                String bname = stdin.readLineSync().toString();
                int year = int.parse(stdin.readLineSync().toString());
                String cname = stdin.readLineSync().toString();
                String ccode = stdin.readLineSync().toString();
                arr2.add(BranchElective(bname, year, cname, ccode));
                break;
              }
          }
        }
        break;
      case 2: {
        print("Enter branch and year");
        String bname = stdin.readLineSync().toString();
        int year = int.parse(stdin.readLineSync().toString());
        print("List of Open Electives:");
        arr1.forEach((element) {print("${element.courseName} ${element.courseCode}");});
        print("List of Branch Electives:");
        arr2.forEach((element) {
          if(element.branch == bname && element.year == year){
            print("${element.courseName} ${element.courseCode}");
          }
        });
      }
        break;
      case 3: {
        exit(0);
      }
    }
  }
}
