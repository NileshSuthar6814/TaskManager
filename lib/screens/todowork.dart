import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:anew/colors.dart';
import '../introduction/1page.dart';

// ignore: must_be_immutable
class ToDoWork extends StatelessWidget {
  final String taskname;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  Function(BuildContext)? editFunction;
  ToDoWork({
    super.key,
    required this.taskname,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
    required this.editFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, right: 14, top: 14),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(15),
          )
        ]),
        startActionPane: ActionPane(
          motion: StretchMotion(),
          children: [SlidableAction(
            onPressed: editFunction,
            icon: Icons.edit,
            backgroundColor: Colors.greenAccent,
            borderRadius: BorderRadius.circular(15),
            ),
            ],
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color:pickerColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Checkbox( 
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.white,
              ),
              Text(
                taskname,
                style: TextStyle(fontSize: 20,
                color: Theme.of(context).primaryColor,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
