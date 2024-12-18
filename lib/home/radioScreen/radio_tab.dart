import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_project/app_Colors.dart';
import 'package:islami_project/home/radioScreen/radio_audios.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset('assets/images/islamiLogo.png'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                    onPressed: (){},
                    child: Text('Radio',style: TextStyle(color: AppColors.blackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryDark,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),

                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                    onPressed: (){},
                    child: Text('Reciters',style: TextStyle(color: AppColors.whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                    ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.selectedColor,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
              ),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                RadioAudiosWidget(name: 'Radio Ibrahim Al-Akdar',
                  imagePath: 'assets/images/audio_bg.png',),
                RadioAudiosWidget(name: 'Radio Al-Qaria Yassen',
                    imagePath: 'assets/images/mute_bg.png'),
                RadioAudiosWidget(name: "Radio Ahmed Al-trabulsi",
                    imagePath: "assets/images/audio_bg.png"),
                RadioAudiosWidget(name: "Radio Addokali Mohammad Alalim",
                    imagePath: "assets/images/audio_bg.png"),
              ],
            ),
          ),
        )

      ],
    );
  }
}
