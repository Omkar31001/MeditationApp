import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/screens/onboarding/signup_page.dart';
import 'package:meditation_app/services/size_config.dart';
import 'package:meditation_app/custom_widgets/button_1.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatelessWidget {
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              "images/mountains.png",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  height: 50.0,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Time to get your\nsoul relaxed',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeVertical! * 0.03,
                ),
                const Text(
                  'Getting more focus in couple minutes using\n simple movements. ',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12.00,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: SizeConfig.safeVertical! * 0.61,
                ),
                Button1(
                  title: 'SignUp',
                  onClicked: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                ),
                SizedBox(
                  height: SizeConfig.safeVertical! * 0.01,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(
                          fontSize: 17.0,
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
          ],
        ),
      ),
    );
  }
}
// onSelected(BuildContext context, String item) {
//   switch(item){
//     case "One":
//       print('Seeing my profile now');
//       break;
//     case 'Two':
//       signOut()
//       print("Going to Sign out...");
//       break;
//   }
// }
