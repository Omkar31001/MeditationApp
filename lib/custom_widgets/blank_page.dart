import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meditation_app/custom_widgets/button_1.dart';
import 'package:meditation_app/services/size_config.dart';

class BlankPage extends StatelessWidget {
  final String title;
  final String img;
  final String msg;

  const BlankPage({
    Key? key,
    required this.title,
    required this.img,
    required this.msg,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
      children: [
          SizedBox(
            height: SizeConfig.safeVertical!*0.2,
          ),
            Image(
              image: AssetImage(img),
              height: SizeConfig.safeHorizontal!*0.7,
            ),
            SizedBox(
              height: SizeConfig.safeVertical!*0.03,
            ),
            Text('Check your mail',style: TextStyle(fontWeight: FontWeight.w600,fontFamily: 'Montserrat',fontSize: 16.0),),
        SizedBox(
          height: SizeConfig.safeVertical!*0.02,
        ),
            Text(title,style: TextStyle(fontSize: 16.0),textAlign: TextAlign.center,),
        SizedBox(
          height: SizeConfig.safeVertical!*0.15,
        ),
            Button1(title: msg, onClicked:(){}),
      ],
    ),
        ),
        );
  }
}
