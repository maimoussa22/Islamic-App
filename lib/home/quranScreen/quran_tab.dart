import 'package:flutter/material.dart';
import 'package:islami_project/app_Colors.dart';
import 'package:islami_project/home/quranScreen/sura_details.dart';
import 'package:islami_project/home/quranScreen/suras_list_widget.dart';
import 'package:islami_project/model/sura_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranTab extends StatefulWidget {


  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  void addSuraList(){
    for(int i = 0; i < 114 ; i++){
      SuraDetailsModal.suraList.add(SuraDetailsModal(
          surasEn: SuraDetailsModal.surasEnNameList[i],
          surasAr: SuraDetailsModal.surasArNameList[i],
          numOfVerses: SuraDetailsModal.numOfVersesList[i],
          fileName: '${i+1}.txt'
      )
      );
    }
}
  initState(){
    addSuraList();
    loadLastSura();
  }
  List<SuraDetailsModal> filteredList = SuraDetailsModal.suraList;
  String searchText = '';

  Map<String,String>lastSuraList={};
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset('assets/images/islamiLogo.png'),
        TextField(
          style: TextStyle(color: AppColors.whiteColor),
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
          onChanged: (text){
            searchText = text;
            filteredList = SuraDetailsModal.suraList.where((suraDetailsModel){
              return suraDetailsModel.surasAr.contains(searchText) ||
              suraDetailsModel.surasEn.toUpperCase().contains(searchText.toUpperCase());
            }).toList();
            setState(() {

            });
          },
        ),
        searchText.isNotEmpty ?
            SizedBox()
            :
        builtMostRecently(),
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
              itemCount: filteredList.length,
                itemBuilder:(context , index){
                  return InkWell(
                    onTap: (){
                      saveLastSura(
                        suraArName: filteredList[index].surasAr,
                        suraEnName: filteredList[index].surasEn,
                        numOfVerses: filteredList[index].numOfVerses.toString(),
                      );
                      Navigator.pushNamed(context, SuraDetailsWidget.routeName,
                          arguments: filteredList[index]
                      );
                      setState(() {

                      });
                    },
                    child: SurasListWidget(
                      suraDetailsModal: filteredList[index],
                      index: index,

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
  Widget builtMostRecently(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(lastSuraList['suraEnName'] ?? '',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(lastSuraList['suraArName'] ?? '',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text("${lastSuraList['numOfVerses'] ?? ''} Verses",
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
      ],
    );
  }

  saveLastSura({required String suraArName , required String suraEnName ,
    required String numOfVerses}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('suraArName',suraArName);
    await prefs.setString('suraEnName',suraEnName);
    await prefs.setString('numOfVerses',numOfVerses);
     loadLastSura();

  }

  getLastSura() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String suraArName = prefs.getString('suraArName')??'';
    String suraEnName = prefs.getString('suraEnName') ?? '';
    String numOfVerses = prefs.getString('numOfVerses') ?? '';
    return{
      'suraArName':suraArName,
      'suraEnName':suraEnName,
      'numOfVerses':numOfVerses,

    };
  }

  loadLastSura() async {
    lastSuraList =await getLastSura();
    setState(() {

    });
  }
}
