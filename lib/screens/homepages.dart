import 'package:anew/database.dart';
import 'package:anew/theme/darktheme.dart';
import 'package:flutter/material.dart';
import 'package:anew/screens/todowork.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import '../introduction/1page.dart';
import 'dailog_box.dart';
import 'package:anew/colors.dart';
import 'package:anew/theme/themedata.dart';

 

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _DataBox = Hive.box('DataBox');
  final _controller = TextEditingController();

  ToDoDatabase db = ToDoDatabase();
  @override
  void initState() {
    //first time data
    if (_DataBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      //exit data
      db.loadData();
    }
    super.initState();
  }

  void checkboxchanged(bool? value, int index) {
    setState(() {
      db.todolist[index][1] = !db.todolist[index][1];
    });
    db.updateDataBase();
  }

  //save mathod
  void saveNewTask() {
    setState(() {
      db.todolist.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void dialogbox() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
    db.updateDataBase();
  }

  void deletetask(int index) {
    setState(() {
      db.todolist.removeAt(index);
    });
    db.updateDataBase();
  }

  void edittask(int index) async{
    dialogbox();
    Duration(seconds:2);
    deletetask(index);
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 2,
        title: const Text(
          " Work To Do",
          style: TextStyle(fontSize: 25,),
        ),
        titleTextStyle:TextStyle(color:Theme.of(context).primaryColor),
        titleSpacing: 2,
        centerTitle: false,
        backgroundColor: pickerColor,
        actions: <Widget>[
          DarkMode(themeChange: themeChange),
          // IconButton(
          //   onPressed: () {

          //   },
          //   icon: const Icon(Icons.nightlight_outlined, size: 30),
          // ),
        ],
        // backgroundColor: Colors.purple[400],
      ),
      body: ListView.builder(
        itemCount: db.todolist.length,
        itemBuilder: (context, index) {
          return ToDoWork(
            taskname: db.todolist[index][0],
            taskCompleted: db.todolist[index][1],
            onChanged: (value) => checkboxchanged(value, index),
            deleteFunction: (context) => deletetask(index),
            editFunction: (context) => edittask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: dialogbox,
        backgroundColor: pickerColor,
        child: const Icon(
          Icons.add,
          size: 30,
          
        ),
      ),
    
    );
  }
}

class DarkMode extends StatelessWidget {
  const DarkMode({
    super.key,
    required this.themeChange,
  });

  final DarkThemeProvider themeChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Checkbox(
            value: themeChange.darkTheme,
            onChanged: (value){
              themeChange.darkTheme = value!;
            },
          ),
    );
  }
}
class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({
    Key? key,
    this.width = 24.0,
    this.height = 24.0,
    this.color,
    this.iconSize,
    this.onChanged,
    this.checkColor, 
    required DarkThemeProvider themeChange,
  }) : super(key: key);

  final double width;
  final double height;
  final Color? color;
  // Now you can set the checkmark size of your own
  final double? iconSize;
  final Color? checkColor;
  final Function(bool?)? onChanged;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() => isChecked = !isChecked);
        widget.onChanged?.call(isChecked);
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.color ?? Colors.grey.shade500,
            width: 8.0,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: isChecked
            ? Icon(
                Icons.check,
                size: widget.iconSize,
                color: widget.checkColor,
              )
            : null,
      ),
    );
  }
}