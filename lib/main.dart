

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/screens/onboarding/forgot_password.dart';
import 'package:meditation_app/screens/onboarding/landing_page.dart';
import 'package:meditation_app/screens/onboarding/login_page.dart';
import 'package:meditation_app/screens/onboarding/main_page.dart';
import 'package:meditation_app/screens/onboarding/signup_page.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(),
        '/login': (context) => StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return MainPage();
              }else if(snapshot.hasError){
              return Center(child:Text("Something went wrong...."));
            }
            else {
                return const LoginPage();
              }
            }
        ),
        '/forgotpassword':(context)=>ForogotPassword(),
        '/signupage':(context)=>SignUpPage(),
        '/mainpage' : (context)=>MainPage(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Montserrat'
        )
      ),
    );
  }
}
