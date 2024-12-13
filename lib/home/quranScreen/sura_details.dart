import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_project/app_Colors.dart';
import 'package:islami_project/home/quranScreen/sura_content_item.dart';
import 'package:islami_project/model/sura_details.dart';

class SuraDetailsWidget extends StatefulWidget {
  static const String routeName ='sura_details';

  @override
  State<SuraDetailsWidget> createState() => _SuraDetailsWidgetState();
}

class _SuraDetailsWidgetState extends State<SuraDetailsWidget> {
  List<String>verses =[];
  int? tappedIndex;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsModal;
    if(verses.isEmpty) {
      loadFileSuras(args.index);
    }
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        title: Text('${args.surasEn}',
        style: TextStyle(
          color: AppColors.primaryDark,
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset('assets/images/details_bg.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,),
          Column(
            children: [
              SizedBox(height: 20,),
              Text(args.surasAr,
              style: TextStyle(
                fontSize: 24,
                color: AppColors.primaryDark,
                fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(height: 40,),
              verses.isEmpty?
              Expanded(
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryDark,
                  ),
                ),
              )
                  :Expanded(
                    child: ListView.builder(
                      itemBuilder: (context , index){
                        return SuraContentItem(content: verses[index],index: index,
                        onTap:(){
                          setState(() {
                            tappedIndex =index;
                          });
                        },
                        isTapped: tappedIndex == index,
                        );
                        },
                      itemCount: verses.length,
                    ),
                  ),
            ],
          ),
      ],
      ),

    );
  }

  void loadFileSuras(int index) async {
    String surasContent = await rootBundle.loadString('assets/files/quran/${index+1}.txt') ;
    List<String> surasLines = surasContent.split('\n');
    setState(() {
      verses = surasLines;
    });
  }
}
