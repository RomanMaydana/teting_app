
import 'package:testing_app/models/task.dart';

abstract class TaskRepository {
  Future<List<Task>> fetchTasks();
  Future<void> addTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(String id);
}