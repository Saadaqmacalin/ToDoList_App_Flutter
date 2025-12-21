import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Container(
        // margin: EdgeInsets.only(top: 45),
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              activeColor: Colors.black,
            ),
            Text(
              taskName,
              style: TextStyle(
                fontSize: 15,
                decoration: taskCompleted
                    ? TextDecoration.lineThrough 
                    : TextDecoration.none,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.yellow,
        ),
      ),
    );
  }
}
