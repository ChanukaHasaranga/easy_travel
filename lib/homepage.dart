import 'package:easy_travel/const/my_color.dart';
import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;    
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                 Text("Hi, Dinidu!",style: TextStyle(color: MyColors.remembercolour,fontSize:width/24.5),),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on,size: width/19.6,color: MyColors.location,),
                    Text("Sydney, Australia ",style: TextStyle(color: MyColors.location,fontSize:width/21.8,fontWeight: FontWeight.bold),),
                    Icon(Icons.arrow_drop_down,size: width/19.6,color: MyColors.location,),


                 ],)


            ],
          ),

         ),

    );
  }
}