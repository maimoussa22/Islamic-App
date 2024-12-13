import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_project/app_Colors.dart';
import 'package:islami_project/home/hadethScreen/hadeth_content_item.dart';
import 'package:islami_project/model/hadeth_details_model.dart';

class HadethDetailsWidget extends StatelessWidget {
  const HadethDetailsWidget({super.key});
  static const String routeName = 'hadeth_details';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethDetailsModal;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        title: Text('Hadith ${args.hadethNum}',
        style:TextStyle(
          color: AppColors.primaryDark
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
              Text(args.title,
                style: TextStyle(
                    fontSize: 24,
                    color: AppColors.primaryDark,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 40,),
              args.content.isEmpty?
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
                    return HadethContentItem(content: args.content[index]);
                  },
                  itemCount: args.content.length,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
