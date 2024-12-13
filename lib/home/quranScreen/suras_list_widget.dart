import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_project/app_Colors.dart';
import 'package:islami_project/model/sura_details.dart';

class SurasListWidget extends StatelessWidget {
  SuraDetailsModal suraDetailsModal ;

  SurasListWidget({required this.suraDetailsModal});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children:[
            Image.asset('assets/images/sura_num.png'),
            Text('${suraDetailsModal.index+1}',
            style: const TextStyle(color: AppColors.whiteColor,
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
                    Text(suraDetailsModal.surasEn,
                      style: const TextStyle(color: AppColors.whiteColor,
                      fontSize: 20
                      ),
                    ),
                    Text('${suraDetailsModal.numOfVerses} Verses',
                      style: const TextStyle(color: AppColors.whiteColor,
                        fontSize: 14
                      ),
                    ),
                  ],
                ),
                Text(suraDetailsModal.surasAr,
                  style: const TextStyle(color: AppColors.whiteColor,
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
