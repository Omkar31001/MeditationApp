import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meditation_app/services/size_config.dart';

class Button1 extends StatelessWidget {
  final String title;
  final VoidCallback onClicked;

  const Button1({
    Key? key,
    required this.title,
    required this.onClicked,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.deepPurple[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          fixedSize: Size(
            SizeConfig.safeHorizontal! * 0.75,
            SizeConfig.safeVertical! * .055,
          ),
          padding: const EdgeInsets.all(8.0),
          textStyle: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 15.0,
            fontWeight: FontWeight.w400,
          )),
      child: Text(title),
      onPressed: onClicked,
    );
  }
}
