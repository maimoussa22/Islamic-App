import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_project/app_Colors.dart';

class SurasListWidget extends StatelessWidget {
  int index;
  String surasEn;
  String ayaNum;
  String surasAr;

  SurasListWidget({required this.index , required this.surasEn ,
    required this.ayaNum , required this.surasAr});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children:[
            Image.asset('assets/images/sura_num.png'),
            Text('${index+1}',
            style: TextStyle(color: AppColors.whiteColor,
            fontWeight: FontWeight.bold
            ),
            )
          ],
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 24,right: 23),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$surasEn',
                      style: TextStyle(color: AppColors.whiteColor,
                      fontSize: 20
                      ),
                    ),
                    Text('$ayaNum Verses',
                      style: TextStyle(color: AppColors.whiteColor,
                        fontSize: 14
                      ),
                    ),
                  ],
                ),
                Text('$surasAr',
                  style: TextStyle(color: AppColors.whiteColor,
                    fontSize: 20
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
