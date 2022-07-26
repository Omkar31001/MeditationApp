import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
import 'package:meditation_app/custom_widgets/button_1.dart';
import 'package:meditation_app/custom_widgets/google_button.dart';
import 'package:meditation_app/custom_widgets/input_field.dart';
import 'package:meditation_app/screens/onboarding/verification_page.dart';
import 'package:meditation_app/services/size_config.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/mountains.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.safeVertical! * 0.07,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Join our Family',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 20.0,
                        fontFamily: 'Montserrat'),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text('Signup to continue!'),
                SizedBox(
                  height: SizeConfig.safeVertical! * 0.01,
                ),
                InputField(title: "Name", msg:"Enter your name",controller: nameController,),
                SizedBox(
                  height: SizeConfig.safeVertical! * 0.02,
                ),
                InputField(title: "Email", msg:"Enter your email",controller: emailController,),
                SizedBox(
                  height: SizeConfig.safeVertical! * 0.02,
                ),
                InputField(title: "Password", msg: "Enter your password",controller: passwordController,),
                SizedBox(
                  height: SizeConfig.safeVertical! * 0.01,
                ),
                InputField(title: "Confirm Password", msg:"Confirm password",controller: confirmPasswordController,),
                SizedBox(
                  height: SizeConfig.safeVertical! * 0.02,
                ),

                Button1(
                  title: "Continue",
                  onClicked: () {
                   signUp();
                  },
                ),
                SizedBox(
                  height: SizeConfig.safeVertical! * 0.02,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(
                          fontSize: 19.0,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Montserrat',
                            fontSize: 16.0),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, '/login');
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
  Future signUp() async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email:emailController.text.trim(),
          password:passwordController.text.trim(),
    );
      Navigator.pushNamed(context, '/login');
  }on FirebaseAuthException catch(e){
      print(e);
    }
  }
}


