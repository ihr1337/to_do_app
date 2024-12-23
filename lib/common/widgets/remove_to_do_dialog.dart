import 'package:flutter/material.dart';
import 'package:to_do_app/common/base_button.dart';
import 'package:to_do_app/common/strings.dart';

class RemoveToDoDialog extends StatelessWidget {
  const RemoveToDoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      content: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Are you sure you want to delete this to do?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      actions: [
        BaseButton(
          style: BaseButtonStyle.confirm(),
          label: AppStrings.ok,
          onTap: () => Navigator.pop(context, true),
        ),
        const SizedBox(height: 5),
        BaseButton(
          style: BaseButtonStyle.cancel(),
          label: AppStrings.cancel,
          onTap: () => Navigator.pop(context, false),
        ),
      ],
    );
  }
}
