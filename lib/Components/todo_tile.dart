import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  // final VoidCallback onDelete;
  Function(BuildContext)? deleteFunction;
  Function(bool?)? onChanged;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    // required this.onDelete,
    required this.deleteFunction,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.yellow.shade200,
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(12),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.yellow,
          ),

          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),

              Expanded(
                child: Text(
                  taskName,
                  style: TextStyle(
                    fontSize: 15,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ),

              // IconButton(
              //   icon: Icon(Icons.cancel, size: 30, color: Colors.yellow[900]),
              //   onPressed: deleteFunction,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
