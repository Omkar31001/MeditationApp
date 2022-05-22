import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meditation_app/custom_widgets/button_1.dart';
import 'package:meditation_app/custom_widgets/container.dart';
import 'package:meditation_app/services/size_config.dart';

class MainPage extends StatelessWidget{
  final user = FirebaseAuth.instance.currentUser;
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(SizeConfig.safeVertical! * 0.16),
          child: AppBar(
            actions: [
              PopupMenuButton<String>(
                  icon: Icon(Icons.settings, color:Colors.black,size: 34.0,),
                  itemBuilder: (context)=>[
                    PopupMenuItem(child:Row(children: [
                      Icon(Icons.boy_outlined,color: Colors.black,size: 35,),
                      Text("My Profile")
                    ])),
                    PopupMenuItem(
                      child: Row(children: [
                        Icon(Icons.logout,color: Colors.black),
                        SizedBox(width: SizeConfig.safeHorizontal!*0.03),
                        ElevatedButton.icon(
                         icon: Icon(Icons.arrow_back,size:32),
                          label: Text(
                            'Sign Out',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          onPressed: () =>{
                        FirebaseAuth.instance.signOut(),
                          }



                        ),
                      ]),
                    ),
                  ]
              )
            ],
            backgroundColor: Colors.white,
            elevation: 0,
            flexibleSpace:Column(
              children:[
                Align(
                  alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: SizeConfig.safeHorizontal!*0.05,top: SizeConfig.safeVertical!*0.05),
                        child: Text("Welcome !",style: TextStyle(fontSize: 19.0,fontFamily: 'Montserrat',fontWeight: FontWeight.w600),)
                    )
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                        padding: EdgeInsets.only(left: SizeConfig.safeHorizontal!*0.055),
                        child: Text("Take a deep breath",style: TextStyle(fontSize: 20.0,fontFamily: 'Montserrat',fontWeight: FontWeight.w200),)
                    )
                )
              ],
            ) ,
          ),
        ),
        body: Column(
          children: [
            ImageContainer(title:"Guided Meditation", img:'images/guidedmed.png',route: '/login',),
            SizedBox(
              height: SizeConfig.safeVertical!*0.05,
            ),
            ImageContainer(title:"Five Minutes Meditation", img:'images/fiveminutesmed.png',route: '/login'),
            SizedBox(
              height: SizeConfig.safeVertical!*0.05,
            ),
            ImageContainer(title:"Sleep Music", img:'images/sleepmusic.png',route: '/login'),

            ElevatedButton(onPressed: ()=>FirebaseAuth.instance.signOut(), child:Text('Sign Out'))
          ],
        ),
      ),
      );

  }
}