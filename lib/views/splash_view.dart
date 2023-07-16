import 'dart:async';
import 'package:flutter/material.dart';
import 'package:spin_well_fortune/views/home_view.dart';


class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  startTimer() {
    Timer( Duration(seconds: 3), () async {
      // Navigator.push(
      //       context, MaterialPageRoute(builder: (c) => HomeView()));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/spin_logo.png",
                width: 219,
                height: 182,
              ),
              const SizedBox(
                height: 10,
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
