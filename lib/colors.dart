import 'package:anew/screens/homepages.dart';
import 'package:anew/theme/darktheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

Color pickerColor2 = const Color(0xff443a49);
Color pickerColor = const Color.fromRGBO(50, 94, 238, 1);

class PickerC extends StatefulWidget {
  const PickerC({super.key});

  @override
  State<PickerC> createState() => _PickerCState();
}

class _PickerCState extends State<PickerC> {
  bool introduction = true;
  bool darkTheme = false;
  void changeColor(Color color) {
    setState(
      () => pickerColor = color,
    );
    setState(() => pickerColor2 = color);
    setState(() {
      if (introduction = true) {
        const first = '/';
      } else {
        const first = '/second';
      }
      introduction = false;
    });
  }

//  void darkbottum(bool? value){
//       setState(() {
//         ThemeMode.value =   value;
//       });
//    }
//   @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Color',style: TextStyle(color: Colors.black),),
      //   titleSpacing:2,
      //   centerTitle: true,
      // ),
      body: Column(
        children: [
          Expanded(
            child: BlockPicker(
              pickerColor: pickerColor,
              onColorChanged: changeColor,
            ),
          ),
          SizedBox(
            child: Container(
              height: 50,
              width: double.infinity,
              margin: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                
              ),
              child: Checkbox(
                value: themeChange.darkTheme,
                onChanged: (value){
                  themeChange.darkTheme = value!;
                },
              ),
            ),
          ),
          SizedBox(
            child: Container(
              height: 50,
              width: double.infinity,
              margin: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: pickerColor,
              ),
              child: const button(),
            ),
          ),
        ],
      ),
    );
  }
}

class button extends StatelessWidget {
  const button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text(
        "Picked color Show here",
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),
      onPressed: () {
        print("hjhjkhh");
        // const Duration(seconds: 2);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const HomePage(),
          ),
        );
      },
    );
  }
}
