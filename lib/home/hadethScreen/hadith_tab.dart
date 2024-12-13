import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_project/app_Colors.dart';

import '../../model/hadeth_details_model.dart';

class HadithTab extends StatefulWidget {
  static const String routeName ='hadeth_screen';

  const HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<HadethDetailsModal>hadethList =[];

  @override
  Widget build(BuildContext context) {
    if(hadethList.isEmpty) {
      loadFileHadeth();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset('assets/images/islamiLogo.png'),
        hadethList.isEmpty?
        const Expanded(
          child: Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryDark,
            ),
          ),
        )
        :CarouselSlider.builder(
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return Container(
              decoration: BoxDecoration(
                color: AppColors.primaryDark,
                borderRadius: BorderRadius.circular(12)
              ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/images/hadeth_details_bg.png',
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 35),
                          child: Text(hadethList[index].title,
                          style: const TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                        ),
                        Expanded(child:
                        Text(hadethList[index].content,
                        textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                        )
                        )
                      ],
                    )
                  ],
                )
            );
          },
          options: CarouselOptions(
            enlargeCenterPage: true,
            height: 600
          ), itemCount: hadethList.length,
        )
      ],
    );
  }

  void loadFileHadeth() async {
    for(int i =1 ;i<=50 ;i++) {
      String hadethContent = await rootBundle.loadString(
          'assets/files/hadeth/h$i.txt');
      List<String> hadethLines = hadethContent.split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      String content = hadethLines.join('\n');
      HadethDetailsModal hadethDetailsModal = HadethDetailsModal(title: title,content: content);
      hadethList.add(hadethDetailsModal);
      setState(() {

      });
    }
  }
}
