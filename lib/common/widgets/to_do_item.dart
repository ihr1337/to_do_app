import 'package:flutter/material.dart';

class ToDoItem extends StatelessWidget {
  final String label;
  final bool isDone;
  final VoidCallback onTap;

  const ToDoItem({
    super.key,
    required this.label,
    required this.isDone,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 20,
      ),
      child: Material(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Colors.green[200]!),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10.0),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(label),
                ),
                const SizedBox(width: 5),
                Checkbox(
                  value: isDone,
                  onChanged: (value) => onTap(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
