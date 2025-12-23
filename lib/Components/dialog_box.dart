import 'package:flutter/material.dart';
import 'package:todolist/Components/my_buttons.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback save;
  VoidCallback cancel;
  
  DialogBox({
    super.key,
    required this.controller,
    required this.save,
    required this.cancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new Task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                myButton(text: "Cancel", onPressed: cancel),
                const SizedBox(width: 50),
                myButton(text: "Save", onPressed: save),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
