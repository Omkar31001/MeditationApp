import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meditation_app/services/size_config.dart';
class InputField extends StatelessWidget {
  final String title;
  final String msg;
  final TextEditingController controller;
  final bool isPassword;
  final VoidCallback ? onChange;

  const InputField({
    Key? key,
    required this.title,
    required this.msg,
    required this.controller,
    this.onChange,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 25.0),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
              )),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.0, top: 5.0, right: 20.0),
          child: TextField(
            obscureText: isPassword,
            controller: controller,
            decoration: InputDecoration(
              hintText: msg,
              hintStyle: TextStyle(
                fontWeight: FontWeight.w500,
              ),
              filled: true,
              fillColor: Colors.white54,
              contentPadding: EdgeInsets.all(5),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
