import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'dart:ui';
import 'customswitch/app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const App()));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: double.infinity,
            color: Color(0xff292929), // Fondo de color #292929
          ),

          // Widget Lottie con efecto de desenfoque
          Lottie.asset(
            'assets/lottie/bg_splash_primary.json',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.contain,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 80.0,
              sigmaY: 50.0,
            ),
            child: Container(),
          ),
          // Contenido adicional encima del fondo animado
          Center(
            child: Lottie.asset(
              'assets/lottie/audio.json',
              width: 88, // ajusta el ancho según tus necesidades
              height: 20, // ajusta la altura según tus necesidades
            ),
          ),
        ],
      ),
    );
  }
}
