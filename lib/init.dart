import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'data_structure.dart';

class Init{
  static Future initialize() async {
    // taskMap.clear();
    await _loadTasks();
  }

  static _loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    courses = prefs.getStringList('courses')?.toSet()??{};
    if(courses.isNotEmpty) {
      for (String course in courses) {
        String? json = prefs.getString(course);
        if(json!=null) {
          Course c = Course.fromJson(jsonDecode(json));
          courseMap[course] = c;
        }
      }
    }
    totalCourses=courses.length;
    calcCGPA();

  }
}