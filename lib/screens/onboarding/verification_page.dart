import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meditation_app/custom_widgets/blank_page.dart';
import 'package:meditation_app/custom_widgets/button_1.dart';
import 'package:meditation_app/services/size_config.dart';

class VerificationPage extends StatelessWidget{
  Widget build(BuildContext context ){
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white38,
        body: Align(
            alignment: Alignment.center,
            child: BlankPage(title: "Please check your mail for \n verification link", img:"images/chakras.png",msg:"Continue",)),
      ),
    );
  }
}