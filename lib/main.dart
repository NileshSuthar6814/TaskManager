import 'package:anew/introduction/1page.dart';
import 'package:anew/screens/homepages.dart';
import 'package:anew/theme/darktheme.dart';
import 'package:anew/theme/themedata.dart';
import 'package:flutter/material.dart';
import 'package:anew/theme/theme.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox("DataBox");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();
  
  final String = 'first';
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }
  
  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }
 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
              theme: Styles.themeData(themeChangeProvider.darkTheme, context),
              initialRoute: 'first',
              routes: {
        '/': (context) => const Firstpage(),
        '/second': (context) => const HomePage(),
        },
        );
        },
      ),
    );
  }
}
