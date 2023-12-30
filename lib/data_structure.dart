import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

int totalCourses = 0;
double cgpa = 0;

class Course{
  String name;
  int credits;
  String grades;

  Course(this.name, this.credits, this.grades);

  @override
  String toString(){
    Map<String, dynamic> json = toJson();
    return json.toString();
  }

  Map<String, dynamic> toJson()=>{
    'name': name,
    'credits': credits,
    'grades': grades,
  };

  Course.fromJson(Map<String, dynamic> json):
    name=json['name'],
    credits=json['credits'],
    grades=json['grades'];
}

Set<String> courses = {};
Map<String, Course> courseMap = {};

double getCGPA(){
  if(courses.isEmpty) return 0.0;
  int totalCredits = 0;
  int totalGrades = 0;
  Course? temp;
  for(String course in courses){
    temp=courseMap[course];
    totalCredits+=temp!.credits;
    totalGrades+=temp.credits*getGrade(temp.grades);
  }

  double unPrecise = totalGrades/totalCredits;

  return double.parse(unPrecise.toStringAsFixed(2));
}

Future<bool> addCourse(Course course) async {
  if(courses.contains(course.name)){
    return false;
  }else{
    courses.add(course.name);
    courseMap[course.name]=course;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('courses', courses.toList());
    prefs.setString(course.name, jsonEncode(course));
    totalCourses++;
    calcCGPA();
    return true;
  }
}

Future<bool> editCourse(Course course, String courseName) async {

  await deleteCourse(courseName);
  await addCourse(course);
  return true;
}

Future<bool> deleteCourse(String course) async{
  courses.remove(course);
  courseMap.remove(course);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove(course);
  prefs.setStringList('courses', courses.toList());
  totalCourses--;
  calcCGPA();
  return true;
}

calcCGPA(){
  cgpa=getCGPA();
}

int getGrade(String grade) {
  return toNumGrade[grade]??0;
}

bool isValidAlpha(String alpha) {
  return toNumGrade.containsKey(alpha);
}

Map<String, int> toNumGrade = {
 'S': 10,
 'A': 9,
 'B': 8,
 'C': 7,
 'D': 6,
 'E': 5,
 'F': 0,
};

Map<int, String> toAlphaGrade = {
  10: 'S',
  9: 'A',
  8: 'B',
  7: 'C',
  6: 'D',
  5: 'E',
  0: 'F',
};