import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/custom_widgets/button_1.dart';
import 'package:meditation_app/main.dart';
import 'package:meditation_app/screens/onboarding/login_page.dart';
import '../../services/size_config.dart';
//App name is Elevate......Icon abhgi dundhna hai

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    String? s = user?.email;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 30.0,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/mainpage');
                },
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 20.0),
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black87),
                  image: DecorationImage(
                    image: AssetImage(
                        'images/adventurer.jpg'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.safeVertical! * 0.03,
            ),
            Text(
              "Hello There.",
              style: TextStyle(
                  fontSize: 19.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500),
            ),
            Text(
              "Stay focused and consistent, \nYou are going good...",
              style: TextStyle(
                  fontSize: 12.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400),
              textAlign:TextAlign.center,
            ),
            SizedBox(
              height: SizeConfig.safeVertical! * 0.03,
            ),
            Column(
              children: [
                Text(
                  "Email",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text('${user?.email}'),
              ],
            ),
            SizedBox(
              height: SizeConfig.safeVertical! * 0.14,
            ),
            Button1(
                title: "Logout",
                onClicked: () {
                  print('sign out ######');
                  FirebaseAuth.instance.signOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Home()));
                }),
            SizedBox(
              height: SizeConfig.safeVertical! * 0.03,
            ),
            Button1(
                title: "Reset Password",
                onClicked: () {
                  FirebaseAuth.instance.sendPasswordResetEmail(email:s!);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LoginPage()));
                }
                ),
          ],
        ),
      ),
    );
  }
}
