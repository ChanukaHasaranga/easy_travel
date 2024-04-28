import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_travel/const/itemcontainer.dart';
import 'package:easy_travel/const/my_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  var searchtext='';
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
                SizedBox(height: height/80,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on,size: width/19.6,color: MyColors.location,),
                    Text("Sydney, Australia ",style: TextStyle(color: MyColors.location,fontSize:width/21.8,fontWeight: FontWeight.bold),),
                    Icon(Icons.arrow_drop_down,size: width/19.6,color: MyColors.location,),
                 ],
                )


            ],
          ),

          actions: [

            Padding(
              padding:  EdgeInsets.only(right: width/20),
              child: Stack(
                children:[
                  Icon(Icons.chat_bubble,color:MyColors.bellicon,size:width/12.5,),
                  Positioned(
                    top: height/310,
                    left: width/18,
                    child: Container(
                      height: height/80,
                      width: width/40,
                      decoration: BoxDecoration(shape:BoxShape.circle,color:Colors.green),
                    ),
                  )
                  
                ],
              
              ),
            ),            
            Padding(
              padding:  EdgeInsets.only(right: width/30),
              child: Stack(
                children:[
                  Icon(Icons.notifications,color:MyColors.bellicon,size:width/12.2,),
                  Positioned(
                    top: height/200,
                    left: width/21,
                    child: Container(
                      height: height/90,
                      width: width/40,
                      decoration: BoxDecoration(shape:BoxShape.circle,color:MyColors.red),
                    ),
                  )
                  
                ],
              
              ),
            ),

          ],

         ),
         body: SingleChildScrollView(
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                Padding(
                  padding:  EdgeInsets.only(right: width/20,left: width/20,top: height/25),
                  child: Container(
                      height: height/13.62,
                      decoration: BoxDecoration(boxShadow: [BoxShadow(blurRadius: 2,color: Color.fromARGB(255, 212, 212, 212),blurStyle: BlurStyle.outer)],borderRadius: BorderRadius.circular(16)),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                           searchtext=value;
                           
                          });
                          searchtext=value;
                        },
                        keyboardType: TextInputType.name,
                        cursorColor: MyColors.black,
                        decoration: InputDecoration(
                          hintText: "Sri lanka",
                          prefixIcon: Icon(Icons.search,color: MyColors.black,size: width/16.36,),
                          hintStyle: TextStyle(color: MyColors.focusbordercolour,fontSize: width/24.5),
                          focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(16),
                           borderSide: BorderSide(color: Colors.transparent)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.transparent),
                          )
                        ),
                        
                      ),
                    ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: width/20,left: width/20,top: height/30),
                  child: Container(
                    height: height/1.5,
                    child: StreamBuilder<QuerySnapshot>(
                      stream:FirebaseFirestore.instance.collection("travel").where("country",isGreaterThanOrEqualTo:searchtext).where("country",isLessThan: '${searchtext}z').snapshots(),
                      builder: (context, snapshot) {
                        if(snapshot.hasError){
                          return Text("Connection Error");
                        }
                        if(snapshot.connectionState==ConnectionState.waiting){
                          return Text("Loading....");
                        }
                        var travelldoc=snapshot.data!.docs;
           
                        return ListView.builder(
                          itemCount: travelldoc.length,
                          itemBuilder:(context, index) {
                            return Padding(
                              padding:  EdgeInsets.only(bottom: height/30),
                              child: itemcontainer(
                                imgpath: travelldoc[index]['imgpath'], 
                                name: travelldoc[index]["name"], 
                                country: travelldoc[index]["country"], 
                                city: travelldoc[index]["city"], 
                                rate: travelldoc[index]["rate"]
                                ),
                            );
                          },
                          
                          );
                      },
                    ),
                  ),
                )
                
            ],
           ),
         ),

    );
  }
}