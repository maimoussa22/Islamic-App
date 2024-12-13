import 'package:flutter/material.dart';
import 'package:islami_project/home_screen.dart';
import 'package:islami_project/my_theme_data.dart';

import 'home/quranScreen/sura_content_item.dart';
import 'home/quranScreen/sura_details.dart';

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
        SuraDetailsWidget.routeName :(context) => SuraDetailsWidget(),
      } ,
      darkTheme: MyThemeData.myTheme,
      themeMode: ThemeMode.dark,
    );
  }
}

