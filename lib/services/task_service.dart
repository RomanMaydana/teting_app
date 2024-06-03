
import 'package:testing_app/models/task.dart';
import 'package:testing_app/repositories/task_repository.dart';

class TaskService {
  TaskService({required this.taskRepository});
  final TaskRepository taskRepository;

  Future<List<Task>> getIncompleteTasks()async{
    final tasks = await taskRepository.fetchTasks();
    return tasks.where((task) => !task.isCompleted).toList();
  }

  Future<void> addNewTask(String title) async {
    final newTask = Task(id: DateTime.now().toString(), title: title);
    await taskRepository.addTask(newTask);
  }

  Future<void> completeTask(String id) async {
    final tasks = await taskRepository.fetchTasks();
    final task = tasks.firstWhere((task) => task.id == id);
    final updatedTask = task.copyWith(isCompleted: true);
    await taskRepository.updateTask(updatedTask);
  }

  Future<void> deleteTask(String id) async {
    await taskRepository.deleteTask(id);
  }
}