import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meditation_app/custom_widgets/button_1.dart';
import 'package:meditation_app/custom_widgets/google_button.dart';
import 'package:meditation_app/custom_widgets/input_field.dart';
import 'package:meditation_app/screens/onboarding/main_page.dart';
import 'package:meditation_app/screens/onboarding/verification_page.dart';
import 'package:meditation_app/services/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

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
                  'Welcome Back',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0,
                      fontFamily: 'Montserrat'),
                  textAlign: TextAlign.center,
                ),
              ),
              Text('Login to continue!'),
              SizedBox(
                height: SizeConfig.safeVertical! * 0.03,
              ),
              InputField(
                title: "Email",
                msg: "Enter your email",
                controller: emailController,
              ),
              SizedBox(
                height: SizeConfig.safeVertical! * 0.02,
              ),
              InputField(
                title: "Password",
                msg: "Enter your password",
                controller: passwordController,
              ),
              SizedBox(
                height: SizeConfig.safeVertical! * 0.003,
              ),
              Padding(
                padding: EdgeInsets.only(right: 7.0, top: 2.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Forgot Password?",
                          style: TextStyle(
                            fontSize: 17.0,
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, '/forgotpassword');
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.safeVertical! * 0.03,
              ),
              Button1(
                title: "Continue",
                onClicked: () {
                  signIn();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                },
              ),
              SizedBox(
                height: SizeConfig.safeVertical! * 0.02,
              ),
              Text("OR",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 19.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(
                height: SizeConfig.safeVertical! * 0.02,
              ),
              GoogleButton(),
              SizedBox(
                height: SizeConfig.safeVertical! * 0.02,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Dont have an account? ",
                      style: TextStyle(
                        fontSize: 19.0,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    TextSpan(
                      text: 'SignUp',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Montserrat',
                          fontSize: 16.0),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, '/signupage');
                        },
                    ),
                  ],
                ),
              ),
            ],
          )),
    ));
  }

  Future signIn() async {
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    }on FirebaseAuthException catch(e){
      print("Something went wrong");
   print(e);
    }

  }
}
