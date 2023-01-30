import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 10,
      title: Text(
        "AR Face Mask App",
        style: TextStyle(
          fontSize: 45,
          color: Colors.deepPurpleAccent,
          fontFamily: "Signatra",
        ),
      ),
      image: Image.asset("images/icon.png"),
      backgroundColor: Colors.white,
      photoSize: 140,
      loaderColor: Colors.deepPurple,
      loadingText: Text(
        "from distoma code",
        style: TextStyle(
          color: Colors.deepPurpleAccent,
          fontSize: 16.0,
          fontFamily: "Brand Bold",
        ),
      ),
    );
  }
}
