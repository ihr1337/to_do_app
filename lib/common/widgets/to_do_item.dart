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
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: 80,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0.1, 0.3),
                  color: Colors.green,
                  blurRadius: 0.5,
                ),
              ],
            ),
            padding: const EdgeInsets.all(10),
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
