import 'package:easy_travel/const/my_color.dart';
import 'package:flutter/material.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:MyColors.white,
      appBar: AppBar(
         leading: IconButton(onPressed:() {
           Navigator.of(context).pop();
         }, icon:Icon(Icons.arrow_back_ios,size:width/30,color: MyColors.darkblue,)),
         backgroundColor:MyColors.white,
         title: Text("Sing in",style:TextStyle(fontSize:width/19.65,color:MyColors.darkblue),),
      ),
      body: SingleChildScrollView(
       child: Column(
        children: [

              
        ],
       ),
      ),

    );
  }
}