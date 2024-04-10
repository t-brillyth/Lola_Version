import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lola_components_ui/widget/avatar_screen.dart';
import 'package:lottie/lottie.dart';
import 'dart:ui';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    // Configuración de la animación de opacidad
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _opacityAnimation = Tween<double>(
      begin: 0.2, // Opacidad inicial al 20%
      end: 1.0, // Opacidad final al 100%
    ).animate(_controller);

    // Iniciar la animación
    _controller.forward();

    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => AvatarScreen()));
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Liberar recursos del controller
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
            'assets/lottie/bg_splash.json',
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
              'assets/lottie/lola_logo.json',
              width: 88, // ajusta el ancho según tus necesidades
              height: 20, // ajusta la altura según tus necesidades
            ),
          ),
          // Agregar el texto de copyright animado
          Positioned(
            left: 0,
            right: 0,
            bottom: 50,
            child: Center(
              child: AnimatedOpacity(
                duration: Duration(seconds: 1),
                opacity: _opacityAnimation.value,
                child: Text(
                  "Copyright - Leapfinancial 2024",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
