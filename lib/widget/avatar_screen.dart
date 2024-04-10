import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'select_avatar.dart'; // Importa el archivo de destino al que deseas redirigir

class AvatarScreen extends StatefulWidget {
  @override
  _AvatarScreenState createState() => _AvatarScreenState();
}

class _AvatarScreenState extends State<AvatarScreen> {
  int _currentIndex = 0;

  final List<String> avatarUrls = [
    'assets/lottie/avatar/avatar_mono.json',
    'assets/lottie/avatar/avatar_zorro.json',
    'assets/lottie/avatar/avatar_oso.json',
    // Agrega más URLs según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Color(0xFF292929),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  height: 45,
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 50,
                        height: 28,
                        child: TextButton(
                          onPressed: () {
                            // Acción al presionar el botón de retroceso
                          },
                          child: const Center(
                            child: Text(
                              'Back',
                              style: TextStyle(
                                color: Color(0xffffffff),
                                fontSize: 12,
                                fontFamily: 'OffBit',
                                height: 1.8,
                              ),
                            ),
                          ),
                          style: ButtonStyle(
                            side: MaterialStateProperty.all<BorderSide>(
                              BorderSide(
                                color: Color(0xa17c7c7c),
                                width: 1.0,
                              ),
                            ),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/images/icon_keyCircle.png',
                        width: null,
                        height: 28,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 250,
                  height: 368,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bg_card_One.jpg'),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Color(0xb47c7c7c),
                      width: 1.74,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Text(
                              "Let's meet Lola",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'OffBit',
                              ),
                            ),
                          ),
                          Text(
                            'Choose the Lola that\nbest suits you',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              height: 1,
                            ),
                          ),
                          SizedBox(height: 40),
                          Container(
                            height: 150,
                            clipBehavior: Clip.none,
                            child: CarouselSlider(
                              options: CarouselOptions(
                                height: 210.0,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _currentIndex = index;
                                  });
                                },
                              ),
                              items: avatarUrls.asMap().entries.map((entry) {
                                final index = entry.key;
                                final url = entry.value;
                                return Builder(
                                  builder: (BuildContext context) {
                                    return GestureDetector(
                                      onTap: () {
                                        // Navegar al archivo de destino
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SelectAvatar(),
                                          ),
                                        );
                                      },
                                      child: Lottie.asset(
                                        url,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
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
