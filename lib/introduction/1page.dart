import 'package:anew/colors.dart';
import 'package:anew/introduction/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  int correntindex = 0;

  late PageController _controller;
  
  
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: poster.length,
              onPageChanged: (int index) {
                setState(() {
                  correntindex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.only(top: 100, right: 20, left: 20),
                  child: Column(
                    children: [
                      SvgPicture.asset(poster[i].image, height: 300),
                      const SizedBox(
                        height: 60,
                      ),
                      Text(
                        poster[i].title,
                        style: const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        poster[i].discription,
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                poster.length, (index) => builDot(index, context)),
          ),
          Container(
            height: 60,
            margin: const EdgeInsets.all(8.0),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
              color:pickerColor,
            ),
            child: TextButton(
              child: Text(
                correntindex == poster.length - 1 ? "Countinue" : "Next",
                style: const TextStyle(color: Colors.black, fontSize: 25),
              ),
              onPressed: () {
                if (correntindex == poster.length - 1) {
                   Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const PickerC(),
                  ), 
                );
                }
                _controller.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Container builDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: correntindex == index ? 20 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color:pickerColor,
      ),
    );
  }
}

// class ColorsPicker extends StatefulWidget {
//   const ColorsPicker({super.key});

//   @override
//   State<ColorsPicker> createState() => _ColorsPickerState();
// }

// class _ColorsPickerState extends State<ColorsPicker> {
//   @override
//   void changeColor(Color color) {
//     setState(() => pickerColor = color);
//     const Duration(seconds: 2);
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (_) => const HomePage(),
//       ),
//     );
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           M(
//             pickerColor: pickerColor,
//             onColorChanged: changeColor,
//           ),
//         ],
//       ),
//     );
//   }
// }

// Color pickerColor = const Color(0xff443a49);
