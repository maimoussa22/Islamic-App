import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_project/app_Colors.dart';

class SuraContentItem extends StatefulWidget {
  static const String routeName = 'content';

  String content ;
  int index;
  bool isTapped;
  VoidCallback onTap;
  SuraContentItem({required this.content , required this.index,
    required this.isTapped , required this.onTap});

  @override
  State<SuraContentItem> createState() => _SuraContentItemState();
}

class _SuraContentItemState extends State<SuraContentItem> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
        decoration: BoxDecoration(
          border:Border.all(color: AppColors.primaryDark,
          width: 2),
          borderRadius: BorderRadius.circular(16),
          color: widget.isTapped? AppColors.primaryDark : Colors.transparent
        ),
        child: Text("${[widget.index+1]} ${widget.content}",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: widget.isTapped? AppColors.blackColor : AppColors.primaryDark,
              fontSize: 20,
          ),
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }
}
