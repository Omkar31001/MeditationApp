import 'package:after_layout/after_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/screens/onboarding/fivemin.dart';
import 'package:meditation_app/screens/onboarding/forgot_password.dart';
import 'package:meditation_app/screens/onboarding/guidedmeditation.dart';
import 'package:meditation_app/screens/onboarding/landing_page.dart';
import 'package:meditation_app/screens/onboarding/login_page.dart';
import 'package:meditation_app/screens/onboarding/main_page.dart';
import 'package:meditation_app/screens/onboarding/profilepage.dart';
import 'package:meditation_app/screens/onboarding/signup_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meditation_app/screens/onboarding/sleepmusic.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: const AuthPage(),
      routes: {
        '/forgotpassword': (context) => ForogotPassword(),
        '/login': (context) => LoginPage(),
        '/signupage': (context) => SignUpPage(),
        '/mainpage': (context) => MainPage(),
        '/guidedmed': (context) => GuidedMed(),
        '/sleepmusic': (context) => SleepMed(),
        '/fivemin': (context) => FiveMed(),
        '/myprofile': (context) => MyProfile(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme:
              Theme.of(context).textTheme.apply(fontFamily: 'Montserrat')),
    );
  }
}

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage> with AfterLayoutMixin<AuthPage> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Home()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LandingPage()));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(color: Colors.purple),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('~~~~~~~~~ ${FirebaseAuth.instance.currentUser?.uid}');
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong...."));
          } else if (snapshot.hasData) {
            return MainPage();
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
