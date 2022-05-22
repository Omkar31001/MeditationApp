import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meditation_app/custom_widgets/button_1.dart';
import 'package:meditation_app/services/size_config.dart';

 class ImageContainer extends StatelessWidget{
   final String title;
   final String img;
   final String route;
   const ImageContainer({
     Key? key,
     required this.title,
     required this.img,
     required this.route,
   }) : super(key: key);
   Widget build(BuildContext context){
     final h = SizeConfig.safeVertical!*0.22;
     final w = SizeConfig.safeHorizontal!*0.93;
     return Align(
       alignment: Alignment.center,
       child: InkWell(
         child: Container(
           child: Padding(
             padding: EdgeInsets.only(top: SizeConfig.safeVertical!*0.08),
             child: Text(title,style: TextStyle(
               fontFamily: 'Montserrat',
               fontSize: 15.0,
               fontWeight: FontWeight.w500,
             ),textAlign: TextAlign.center,),
           ),
           height: h,
           width: w,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.all(Radius.circular(10)),
             boxShadow: [
               BoxShadow(
                 color: Colors.black26,
                 blurRadius: 25.0, // soften the shadow
                 spreadRadius: 5.0, //extend the shadow
                 offset: Offset(
                   15.0, // Move to right 10  horizontally
                   15.0, // Move to bottom 10 Vertically
                 ),
               )
             ],
             image:DecorationImage(
               image:AssetImage(img),
               fit: BoxFit.fill,
             ),
             shape: BoxShape.rectangle,
           ),
         ),
         onTap: (){
           Navigator.pushNamed(context,route);
         },
       ),
     );
   }
 }