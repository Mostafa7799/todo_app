import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../models/user_model.dart';

class AppViewModel extends ChangeNotifier {
  List<Task> tasks = <Task>[];
  User user = User("Mostafa");

  ///App Colors
  Color clrLvl1 = Colors.grey.shade50;
  Color clrLvl2 = Colors.grey.shade200;
  Color clrLvl3 = Colors.grey.shade800;
  Color clrLvl4 = Colors.grey.shade900;
  Color clrLvl5 = Colors.green;

  ///Get number of tasks
  int get numTasks => tasks.length;

  ///Get number of tasks Remaining
  int get numTasksRemaining => tasks.where((task) => !task.complete).length;

  ///Get User name
  String get username => user.username;

  ///Add new task
  void addTask(Task newTask) {
    tasks.add(newTask);
    notifyListeners();
  }

  /// Get num of tasks
  bool getTaskValue(int taskIndex) {
    return tasks[taskIndex].complete;
  }

  /// get title task
  String getTaskTitle(int taskIndex) {
    return tasks[taskIndex].title;
  }

  /// delete task
  void deleteTask(int taskIndex) {
    tasks.removeAt(taskIndex);
    notifyListeners();
  }

  ///set tasks value complete
  void setTaskValue(int taskIndex, bool taskValue) {
    tasks[taskIndex].complete = taskValue;
    notifyListeners();
  }

  ///update user name form setting icon
  void updateUsername(String newUsername) {
    user.username = newUsername;
    notifyListeners();
  }

  ///to delete all tasks
  void deleteAllTasks() {
    tasks.clear();
    notifyListeners();
  }

  ///delete complete tasks only
  void deleteCompletedTasks() {
    tasks = tasks.where((task) => !task.complete).toList();
    notifyListeners();
  }

  void bottomSheetBuilder(Widget bottomSheetView, BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: ((context) {
        return bottomSheetView;
      }),
    );
  }
}
