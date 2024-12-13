import 'package:flutter/material.dart';
import 'package:islami_project/app_Colors.dart';
import 'package:islami_project/home/quranScreen/sura_details.dart';
import 'package:islami_project/home/quranScreen/suras_list_widget.dart';
import 'package:islami_project/model/sura_details.dart';

class QuranTab extends StatefulWidget {


  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset('assets/images/islamiLogo.png'),
        TextField(
          cursorColor: AppColors.whiteColor,
          decoration: InputDecoration(
              hintText: 'Sura Name',
              hintStyle: const TextStyle(color: Colors.white),
              prefixIcon: const ImageIcon(AssetImage('assets/images/QuranVector.png'),
                color: Colors.white,),
              enabledBorder: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      color: AppColors.primaryDark,
                      width: 2
                  )
              ),
              focusedBorder:OutlineInputBorder(
                  borderRadius:BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      color: AppColors.primaryDark,
                      width: 2
                  )
              )
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 21,top: 20),
          child: Text('Most Recently',
          style: TextStyle(color: AppColors.whiteColor,
          fontSize: 16,
            fontWeight: FontWeight.bold
          ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 17,vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.primaryDark
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sura En',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  Text('Sura Ar',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text('Aya num',
                  style: TextStyle(
                    fontSize: 14,
                      fontWeight: FontWeight.bold
                  ),
                  ),
                ],
              ),
              Image.asset('assets/images/mostRecently.png')
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 21,top: 10),
          child: Text('Suras List',
            style: TextStyle(color: AppColors.whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        const SizedBox(height: 10,),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 20),
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: SuraDetailsModal.numOfVersesList.length,
                itemBuilder:(context , index){
                  return InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, SuraDetailsWidget.routeName,
                          arguments: SuraDetailsModal.getSuraDetails(index)
                      );
                      setState(() {

                      });
                    },
                    child: SurasListWidget(
                        suraDetailsModal:SuraDetailsModal.getSuraDetails(index)
                    ),
                  );
                },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  thickness: 2,
                  indent: 50,
                  endIndent: 50,
                );
              },

            ),
          ),
        )
      ],
    );
  }
}
