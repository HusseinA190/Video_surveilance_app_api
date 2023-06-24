import 'dart:async';
import 'package:flutter/material.dart';

import '../../intro.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) =>
                const IntroScreen()
            ))
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: const [ CircleAvatar(
                backgroundColor: Colors.black,
                radius: 80,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image( width: 270,
                    height: 270,

                    image: AssetImage('assets/images/Logo.png',



                    ),
                  ),
                ),
              )
              ],
            ),



          ],
        ),
      ),
    );
  }
}
