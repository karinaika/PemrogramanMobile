import './task.dart';

class Plan {
  final String name;
  final List<Task> tasks;

  const Plan({this.name = '', this.tasks = const []});

  // Hitung jumlah task yang sudah selesai
  int get completedCount => tasks
      .where((task) => task.complete)
      .length;

  // Pesan ringkasan jumlah task
  String get completenessMessage =>
      '$completedCount out of ${tasks.length} tasks';
}
