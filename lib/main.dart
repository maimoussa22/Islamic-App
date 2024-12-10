import 'package:flutter/material.dart';
import 'package:islami_project/home_screen.dart';
import 'package:islami_project/my_theme_data.dart';

void main(){
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName ,
      routes:{
        HomeScreen.routeName :(context) => HomeScreen(),
      } ,
      darkTheme: MyThemeData.myTheme,
      themeMode: ThemeMode.dark,
    );
  }
}

