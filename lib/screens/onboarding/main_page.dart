import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meditation_app/custom_widgets/container.dart';
import 'package:meditation_app/services/size_config.dart';
import 'package:shimmer/shimmer.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late bool isLoading;

  void initState() {
    isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  final user = FirebaseAuth.instance.currentUser;

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(SizeConfig.safeVertical! * 0.16),
          child: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  print('Seeing my profile now');
                  Navigator.pushNamed(context, '/myprofile');
                },
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 34.0,
                ),
              )
            ],
            backgroundColor: Colors.white,
            elevation: 0,
            flexibleSpace: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: SizeConfig.safeHorizontal! * 0.05,
                            top: SizeConfig.safeVertical! * 0.05),
                        child: Text(
                          "Welcome !",
                          style: TextStyle(
                              fontSize: 19.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600),
                        ))),
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: SizeConfig.safeHorizontal! * 0.055),
                        child: Text(
                          "Take a deep breath",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w200),
                        )))
              ],
            ),
          ),
        ),
        body: Column(children: [
          isLoading
              ? Shimmer.fromColors(
                  baseColor: Colors.grey[900]!,
                  highlightColor: Colors.grey[200]!,
                  child: Center(child: Skeleton()))
              : ImageContainer(
                  title: "Guided Meditation",
                  img: 'images/guidedmed.png',
                  route: '/guidedmed',
                ),
          SizedBox(
            height: SizeConfig.safeVertical! * 0.05,
          ),
          isLoading
              ? Shimmer.fromColors(
                  baseColor: Colors.grey[900]!,
                  highlightColor: Colors.grey[200]!,
                  child: Center(child: Skeleton()))
              : ImageContainer(
                  title: "Five Minutes Meditation",
                  img: 'images/fiveminutesmed.png',
                  route: '/fivemin',
                ),
          SizedBox(
            height: SizeConfig.safeVertical! * 0.05,
          ),
          isLoading
              ? Shimmer.fromColors(
                  baseColor: Colors.grey[900]!,
                  highlightColor: Colors.grey[200]!,
                  child: Center(child: Skeleton()))
              : ImageContainer(
                  title: "Sleep Music",
                  img: 'images/sleepmusic.png',
                  route: '/sleepmusic',
                ),
        ]),
      ),
    );
  }
}

class Skeleton extends StatelessWidget {
  final double? height, width;

  const Skeleton({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: SizeConfig.safeVertical! * 0.22,
        width: SizeConfig.safeHorizontal! * 0.93,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ));
  }
}
