import 'package:easy_travel/const/my_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class splashscreen extends StatelessWidget {
  const splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    print(width);
    return SafeArea(
      child: Scaffold(
      
              body:Stack(
                children:[ Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image:AssetImage("sourcess/background.png"),fit: BoxFit.cover)
                  ),
                  
                ),

                Padding(
                  padding:  EdgeInsets.only(top:height/11.7),
                  child: Column(
                    children: [
                      Padding(
                  padding:  EdgeInsets.only(left:width/3.2,right:width/3.2),
                        child: Container(
                          decoration: BoxDecoration(
                          color: MyColors.white,
                          borderRadius: BorderRadius.circular(30)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Container(
                              height: height/20,
                              width: width/12,
                              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("sourcess/splashlogo.png"),fit:BoxFit.contain)),  
                            ),
                            SizedBox(width:width/56,),
                            Container(
                              height: height/41,
                              width: width/5,
                              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("sourcess/EasyTravelz.png"),fit:BoxFit.contain)),  
                            ),                          
                          ],),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: height/1.9),
                        child: Text("Let’s explore\nthe world with us",style: TextStyle(color:MyColors.white,fontSize:width/10.9,fontWeight:FontWeight.bold,),textAlign:TextAlign.center,),
                      ),
                      Text("World largest digital travelling supporter",style: TextStyle(color:MyColors.white,fontSize:width/24.5,)),                      

                    ],
                  ),
                )
                ]
              ) ,
      ),
    );
  }
}