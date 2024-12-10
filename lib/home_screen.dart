import 'package:flutter/material.dart';
import 'package:islami_project/app_Colors.dart';
import 'package:islami_project/hadith_tab.dart';
import 'package:islami_project/quran_tab.dart';
import 'package:islami_project/radio_tab.dart';
import 'package:islami_project/tasbeh_tab.dart';
import 'package:islami_project/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex =0;

  List<String> imageBackground = [
    'assets/images/home_bg.png',
    'assets/images/hadith_bg.png',
    'assets/images/sebha_bg.png',
    'assets/images/radio_bg.png',
    'assets/images/time_bg.png'
  ];
  List<Widget> tabs = [
    QuranTab(),
    HadithTab(),
    TasbehTab(),
    RadioTab(),
    TimeTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        Image.asset(imageBackground[selectedIndex],
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.primaryDark,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.whiteColor,
          unselectedItemColor: AppColors.blackColor,
          currentIndex: selectedIndex,
          onTap:(index){
            selectedIndex =index ;
            setState(() {

            });
          } ,
          items: [
            BottomNavigationBarItem(
                icon: builtItemInBottomNavigationBar(index: 0, iconName: "quran_icon"),
                label: 'Quran',
            ),
            BottomNavigationBarItem(
                icon: builtItemInBottomNavigationBar(index: 1, iconName: "hadith_icon"),
                label: 'Hadith'
            ),
            BottomNavigationBarItem(
                icon: builtItemInBottomNavigationBar(index: 2, iconName: "sebha_icon"),
                label: 'Tasbeh'
            ),
            BottomNavigationBarItem(
                icon: builtItemInBottomNavigationBar(index: 3, iconName: "radio_icon"),
                label: 'Radio'
            ),
            BottomNavigationBarItem(
                icon: builtItemInBottomNavigationBar(index: 4, iconName: "time_icon"),
                label: 'Time'
            ),
        ],

        ),
        body: tabs[selectedIndex],
      ),
    ]
    ) ;
  }
  Widget builtItemInBottomNavigationBar ({required index , required iconName}){
    return selectedIndex== index ?Container(
      decoration:BoxDecoration(
        color: AppColors.selectedColor,
        borderRadius: BorderRadius.circular(66),
      ) ,
      width: 59,
      height: 34,
      child:ImageIcon(AssetImage('assets/images/$iconName.png')),
    )
    : ImageIcon(AssetImage('assets/images/$iconName.png'));
  }
}

