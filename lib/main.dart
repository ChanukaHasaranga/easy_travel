import 'package:easy_travel/loadingscreen.dart';
import 'package:flutter/material.dart';

void main(){

runApp(Myapp());

}class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
     title: "Easy Travel",
     home:loadingscreen(),
     theme: ThemeData(
              brightness: Brightness.light
            ),

     );


  }
}