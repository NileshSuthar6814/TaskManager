import 'package:flutter/material.dart';

import '../colors.dart';
import '../introduction/1page.dart';
 

class DialogBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
   DialogBox({super.key, required this.controller,required this.onCancel,required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      
      content: SizedBox(
        
        height: 150,
        child: Column(
          children: [
            //text input fild
            TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "New Task"),
              validator: (text) {
                if (controller == null || controller.isEmpty) {
                  return 'Text is empty';
                }
                return null;
              },
            ),
            //text delete button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [ 
                  MyButtons(text: "save", onpressed: onSave),
                  //gappp
                  SizedBox(width: 10),
                  // delet buttons
                  MyButtons(text: "Cancel", onpressed:onCancel),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//buttons
class MyButtons extends StatelessWidget {
  final String text;
  VoidCallback onpressed;
  MyButtons({
    super.key,
    required this.text,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
      color: pickerColor,
      child: Text(text),
    );
  }
}
