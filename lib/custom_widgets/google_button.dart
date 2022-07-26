import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meditation_app/services/size_config.dart';


class GoogleButton extends StatelessWidget{
  final VoidCallback onClicked;
  const GoogleButton({
    Key? key,
    required this.onClicked,
  }) : super(key: key);
  Widget build(BuildContext context){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary:Colors.black26,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          fixedSize: Size(
            SizeConfig.safeHorizontal! *0.87,
            SizeConfig.safeVertical! *.055,
          ),
          padding: const EdgeInsets.all(8.0),
          textStyle: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 15.0,
            fontWeight:FontWeight.w400,
          )

      ),
      child: Row(children:[
        Padding(
            padding: EdgeInsets.only(left:SizeConfig.safeHorizontal!*0.07)
        ),
        Image.asset("images/googleimg.png",),
        Padding(
            padding: EdgeInsets.only(left:SizeConfig.safeHorizontal!*0.02)
        ),
        Text("Continue with Google",style: TextStyle(fontWeight: FontWeight.w500),
        )
      ],),

        onPressed: onClicked,
    );

  }
}