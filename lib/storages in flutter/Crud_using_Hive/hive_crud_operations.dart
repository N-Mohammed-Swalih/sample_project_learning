import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('to_do_app Box');
  runApp(MaterialApp(
    home: HiveOperations(),
  ));
}

class HiveOperations extends StatefulWidget {
  HiveOperations({super.key});

  @override
  State<HiveOperations> createState() => _HiveOperationsState();
}

class _HiveOperationsState extends State<HiveOperations> {
  final task_controller = TextEditingController();
  final content_controller = TextEditingController();
  final mybox = Hive.box('to_do_app Box');
  void initState() {
    load_or_read_Task();
    super.initState();
  }

  List<Map<String, dynamic>> task = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do App"),
      ),
      body: task.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: task.length,
              itemBuilder: (context, index) {
                final mytask = task[index]; //fetch each single map from list
                return Card(
                  child: ListTile(
                    title: Text(mytask['taskname']),
                    subtitle: Text(mytask['taskcontent']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            showTask(context, mytask["id"]);
                          },
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.delete))
                      ],
                    ),
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showTask(context, null);
          },
          label: const Text("Create Task"),
          icon: Icon(Icons.add)),
    );
  }

  void showTask(BuildContext context, int? itemkey) {
    if (itemkey != null) {
      final existingTask =
          task.firstWhere((element) => element['id'] == itemkey);
      task_controller.text = existingTask['taskname'];
      content_controller.text = existingTask['taskcontent'];
    }
    //itemkey is similar to id in sqflite
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(
              top: 15,
              bottom: MediaQuery.of(context).viewInsets.bottom + 120,
              left: 15,
              right: 15,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: task_controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Task Name",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: content_controller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Task Content"),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (task_controller.text != "" &&
                          content_controller.text != "") {
                        if (itemkey == null) {
                          createTask({
                            'id': itemkey,
                            'name': task_controller.text.trim(),
                            'content': content_controller.text.trim(),
                          });
                        } else {
                          updateTasks(itemkey, {
                            'name': task_controller.text.trim(),
                            'content': content_controller.text.trim(),
                          });
                        }
                      }
                      content_controller.text = "";
                      task_controller.text = "";
                      Navigator.of(context).pop();
                    },
                    child:
                        Text(itemkey == null ? 'Create Task' : 'Update Task'))
              ],
            ),
          );
        });
  }

  Future<void> createTask(Map<String, dynamic> task) async {
    await mybox.add(task);
    load_or_read_Task();
  }

  Future<void> updateTasks(
      int? itemkey, Map<String, dynamic> updatetask) async {}

  void load_or_read_Task() {
    final task_from_hive = mybox.keys.map((key) {
      final value = mybox.get(key);
      return {
        'id': key,
        'taskname': value['name'],
        'taskcontent': value['content']
      };
    }).toList();
    setState(() {
      task = task_from_hive.reversed.toList();
    });
  }
}
