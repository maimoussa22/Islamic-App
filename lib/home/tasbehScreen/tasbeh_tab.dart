import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_project/app_Colors.dart';

class TasbehTab extends StatefulWidget {
   TasbehTab({super.key});

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  double turns =0.0;
  int counter =0;
  int index =0;
  List<String> tasbeh = ['سُبْحَانَ اللَّهِ ','الْحَمْدُ للّهِ َ',
    'الْلَّهُ أَكْبَرُ ِ','لَا إِلَهَ إِلَّا اللَّهُ '];

  void incrementCounter(){
    setState(() {
      turns += 1/24;
      counter++;
      if(counter == 33){
        counter = 0;
        index = (index + 1) % tasbeh.length;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset('assets/images/islamiLogo.png'),
        Text('سَبِّحِ اسْمَ رَبِّكَ الأعلى',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor
        ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Image.asset('assets/images/sebhaCon.png'),
                AnimatedRotation(turns: turns,
                duration: Duration(seconds: 1),
                child: InkWell(
                    onTap: incrementCounter,
                    child: Image.asset('assets/images/sebhaBody.png')
                ),
                ),
              ],
            ),
            Positioned(
              top: 220,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${tasbeh[index]}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor
                    ),
                  ),
                  Text('$counter',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
