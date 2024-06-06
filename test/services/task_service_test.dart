import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:testing_app/models/task.dart';
import 'package:testing_app/repositories/task_repository.dart';
import 'package:testing_app/services/task_service.dart';

// Generate mock code to TaskRespository
@GenerateMocks([TaskRepository])
import 'task_service_test.mocks.dart';

void main() {
  group('TaskService', () {
    late TaskService taskService;
    late MockTaskRepository mockTaskRepository;

    setUp(() {
      mockTaskRepository = MockTaskRepository();
      taskService = TaskService(taskRepository: mockTaskRepository);
    });

    test('getIncompleteTasks returns only incomplete tasks', () async {
      final tasks = [
        Task(id: '1', title: 'Task 1', isCompleted: false),
        Task(id: '2', title: 'Task 2', isCompleted: true),
        Task(id: '3', title: 'Task 3', isCompleted: false),
      ];

      when(mockTaskRepository.fetchTasks()).thenAnswer((_) async => tasks);
      final incompleteTasks = await taskService.getIncompleteTasks();
      expect(incompleteTasks.length, 2);
      expect(incompleteTasks[0].id, '1');
      expect(incompleteTasks[1].id, '3');
    });

    test('AddNewTask adds a task to the repository', () async {
      // verifyNever(mockTaskRepository.addTask(any));
      when(mockTaskRepository.addTask(any)).thenAnswer((_) async => {});
      await taskService.addNewTask('New Task');

      final verification = verify(mockTaskRepository.addTask(captureAny));
      verification.called(1);
      print(verification.captured);
      // verifyNever(mockTaskRepository.addTask(captureAny));
      final captureTask = verification.captured.first as Task;
      expect(captureTask.title, 'New Task');
      expect(captureTask.isCompleted, false);
    });

    test('completeTask updates the task to completed', () async {
      final tasks = [
        Task(id: '1', title: 'Task 1', isCompleted: false),
        Task(id: '2', title: 'Task 2', isCompleted: true),
      ];
      when(mockTaskRepository.fetchTasks()).thenAnswer((_) async => tasks);
      when(mockTaskRepository.updateTask(any)).thenAnswer((_) async => {});

      await taskService.completeTask('1');

      final verification = verify(mockTaskRepository.updateTask(captureAny));
      verification.called(1);

      final captureTask = verification.captured.first as Task;
      expect(captureTask.id, '1');
      expect(captureTask.isCompleted, true);
    });

    test('deleteTask removes a task from the repository', () async {
            final tasks = [
        Task(id: '1', title: 'Task 1', isCompleted: false),
        Task(id: '2', title: 'Task 2', isCompleted: true),
      ];
      when(mockTaskRepository.fetchTasks()).thenAnswer((_) async => tasks);
      when(mockTaskRepository.deleteTask(any)).thenAnswer((_) async => {} );

      await taskService.deleteTask('1');
      final verification = verify(mockTaskRepository.deleteTask(captureAny));
      verification.called(1);
      final captureTask = verification.captured.first as String;
      expect(captureTask, '1');
      
    });
  });
}
