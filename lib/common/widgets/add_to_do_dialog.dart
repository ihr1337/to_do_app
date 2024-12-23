import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/common/base_button.dart';
import 'package:to_do_app/common/strings.dart';
import 'package:to_do_app/state/to_do_list_notifier.dart';

class AddToDoDialog extends StatefulWidget {
  const AddToDoDialog({super.key});

  @override
  State<AddToDoDialog> createState() => _AddToDoDialogState();
}

class _AddToDoDialogState extends State<AddToDoDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        BaseButton(
          style: BaseButtonStyle.confirm(),
          disabledStyle: BaseButtonStyle(
            color: Colors.green[200]!,
            highlightColor: Colors.green[200]!,
            labelColor: Colors.white,
          ),
          label: AppStrings.add,
          enabled: _controller.text.isNotEmpty,
          onTap: _confirm,
        ),
        const SizedBox(height: 5),
        BaseButton(
          style: BaseButtonStyle.cancel(),
          disabledStyle: BaseButtonStyle(
            color: Colors.red[200]!,
            highlightColor: Colors.red[400]!,
            labelColor: Colors.white,
          ),
          label: AppStrings.cancel,
          onTap: () => Navigator.pop(context, false),
        ),
      ],
      content: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: AppStrings.newToDoTitle,
              ),
              onChanged: (value) => setState(() {}),
              minLines: 1,
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }

  void _confirm() {
    final notifier = context.read<ToDoListNotifier>();

    notifier.setTitle(_controller.text);
    Navigator.pop(context, true);
  }
}
