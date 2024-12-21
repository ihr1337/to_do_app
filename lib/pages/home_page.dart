import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/common/dialog_builder_mixin.dart';
import 'package:to_do_app/common/strings.dart';
import 'package:to_do_app/common/widgets/to_do_item.dart';
import 'package:to_do_app/state/to_do_list_notifier.dart';

class HomePage extends StatefulWidget {
  static const String path = '/home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with DialogBuilderMixin {
  @override
  Widget build(BuildContext context) {
    return Consumer<ToDoListNotifier>(
      builder: (context, notifier, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppStrings.appName,
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: _addToDo,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: notifier.toDoList.length,
                  itemBuilder: (_, i) {
                    final item = notifier.toDoList[i];

                    return Dismissible(
                      key: Key(item.id.toString()),
                      onDismissed: (_) => notifier.removeToDo(item),
                      confirmDismiss: (_) => removeToDoDialog(),
                      child: ToDoItem(
                        label: item.label,
                        isDone: item.isDone,
                        onTap: () => notifier.complete(item.id),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _addToDo() async {
    final notifier = context.read<ToDoListNotifier>();
    final confirmed = await addToDoDialog();

    if (confirmed && mounted) notifier.addToDo();
  }
}
