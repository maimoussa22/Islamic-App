import 'package:flutter/cupertino.dart';

import '../../app_Colors.dart';

class RadioAudiosWidget extends StatelessWidget {

  String name;
  String imagePath;
  RadioAudiosWidget({required this.name , required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      width: 390,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryDark,
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover, ),
      ),
      child: Column(
        children: [
          SizedBox(height: 8,),
          Text(name,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 40,),
          Image.asset('assets/images/audio_icon.png'),
          SizedBox(height: 13,),

        ],
      ),
    );
  }
}
