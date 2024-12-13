import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_project/app_Colors.dart';

class HadethContentItem extends StatelessWidget {
  static const String routeName = 'content';

  String content ;
  HadethContentItem({required this.content });


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.symmetric(horizontal: 20,),
      child: Text(" ${content}",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: AppColors.primaryDark,
            fontSize: 20,
          fontWeight: FontWeight.bold
        ),
        textDirection: TextDirection.rtl,
      ),
    );
  }
}