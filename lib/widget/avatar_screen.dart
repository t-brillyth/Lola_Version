import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:ui';

class AvatarScreen extends StatefulWidget {
  @override
  _AvatarScreenState createState() => _AvatarScreenState();
}

class _AvatarScreenState extends State<AvatarScreen> {
  int _currentIndex = 0;

  final List<String> avatarUrls = [
    'assets/images/avatar/avatar_mono.png',
    'assets/images/avatar/avatar_oso.png',
    'assets/images/avatar/avatar_zorro.png',
    // Agrega más URLs según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Color(0xFF292929), // Fondo de color #292929
          ),
          // Contenedor rojo con texto y slide de avatares
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Contenedor rojo con bordes redondeados
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 280,
                    height: 340,
                    // Fondo con imagen Lottie
                    child: Stack(
                      children: [
                        // Imagen Lottie
                        Lottie.asset(
                          'assets/lottie/bg_splash_primary.json', // Ruta de tu archivo Lottie
                          fit: BoxFit
                              .fill, // Ajusta la imagen Lottie al contenedor
                        ),
                        // Fondo desenfocado
                        Positioned.fill(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 90,
                              sigmaY: 60,
                            ), // Aplica un efecto de desenfoque
                            child: Container(
                              color: Colors.black.withOpacity(
                                  0.5), // Color de fondo con opacidad
                            ),
                          ),
                        ),
                        // Contenido dentro del contenedor
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Let's meet Lola",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'OffBit',
                              ),
                            ),
                            Text(
                              'Choose the Lola that\nbest suits you',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            SizedBox(height: 20),
                            // Slide de avatares
                            Container(
                              height: 200,
                              clipBehavior: Clip
                                  .none, // Permite que los elementos de la lista se muestren fuera del límite del contenedor
                              child: PageView.builder(
                                itemCount: avatarUrls.length,
                                onPageChanged: (index) {
                                  setState(() {
                                    _currentIndex = index;
                                  });
                                },
                                itemBuilder: (context, index) {
                                  return Image.asset(
                                    avatarUrls[index], // Utiliza Image.asset
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),
                Text(
                  'Slide and tap to choose',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
