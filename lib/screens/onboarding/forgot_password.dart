import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meditation_app/custom_widgets/button_1.dart';
import 'package:meditation_app/custom_widgets/google_button.dart';
import 'package:meditation_app/custom_widgets/input_field.dart';
import 'package:meditation_app/services/size_config.dart';


class ForogotPassword extends StatefulWidget {
  const ForogotPassword({Key? key}) : super(key: key);

  @override
  State<ForogotPassword> createState() => _ForogotPasswordState();
}

class _ForogotPasswordState extends State<ForogotPassword> {
  final emailController = TextEditingController();
  final auth  = FirebaseAuth.instance;

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/mountains.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.safeVertical! * 0.07,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Forgot Password?',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0,
                          fontFamily: 'Montserrat'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text('Dont worry! Just enter your email'),
                  SizedBox(
                    height: SizeConfig.safeVertical! * 0.08,
                  ),
                  InputField(title: "Email",msg: "Enter your email",controller:emailController,),

                  SizedBox(
                    height: SizeConfig.safeVertical! * 0.47,
                  ),
                  Button1(
                    title: "Continue",
                    onClicked: ()  =>{
                       auth.sendPasswordResetEmail(email:emailController.text),
                      Navigator.of(context).pop(),
                  },
                  ),

                ],
              )),
        ));
  }

}

