import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:ui';

import '../widget/avatar_screen.dart';
import '../widget/select_avatar.dart'; // Agregar esta línea para importar ImageFilter

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({Key? key}) : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  double _switchWidth = 165.0;
  double _switchHeight = 88.44;

  Duration _animationDuration = Duration(milliseconds: 300);
  Duration _animationDurationThumb = Duration(milliseconds: 100);

  bool _isDark = true;

  void _onTapSwitch() {
    setState(() {
      _isDark = !_isDark;
    });
  }

  @override // Importa AvatarScreen

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: AnimatedOpacity(
              opacity: _isDark ? 0 : 1,
              duration: _animationDuration,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff292929),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          if (!_isDark)
            Positioned(
              left: MediaQuery.of(context).size.width / 2 - 130,
              top: MediaQuery.of(context).size.height / 2 - 150,
              child: InkWell(
                onTap: _onTapSwitch,
                child: Container(
                  width: 260.0,
                  height: 260.0,
                  decoration: BoxDecoration(
                    color: Color(0xffa03b3b),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          Positioned(
            bottom: 20,
            right: 15,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: _onTapSwitch,
                    child: SizedBox(
                      width: _switchWidth,
                      height: _switchHeight,
                      child: Stack(
                        children: [
                          AnimatedPositioned(
                            duration: _animationDuration,
                            width: _isDark ? _switchWidth : 0,
                            top: 2.5,
                            bottom: 0,
                            right: 5,
                            child: Container(
                              width: _switchWidth,
                              height: _switchHeight,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/bg_dark.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                            duration: _animationDuration,
                            top: 0,
                            bottom: 0,
                            left: _isDark ? 0 : (_switchWidth - _switchHeight),
                            child: AnimatedOpacity(
                              opacity: _isDark ? 1 : 0,
                              duration: _animationDurationThumb,
                              child: Container(
                                child: Image.asset(
                                    'assets/images/toggle_dark.png'),
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                            duration: _animationDuration,
                            width: _isDark ? 0 : _switchWidth,
                            top: 2.5,
                            bottom: 0,
                            left: 5,
                            child: Container(
                              width: _switchWidth,
                              height: _switchHeight,
                              child: Lottie.asset(
                                'assets/lottie/animate_audio.json',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                            duration: _animationDuration,
                            top: 0,
                            bottom: 0,
                            left: _isDark ? 0 : (_switchWidth - _switchHeight),
                            child: AnimatedOpacity(
                              opacity: _isDark ? 0 : 1,
                              duration: _animationDurationThumb,
                              child: Container(
                                child: Image.asset(
                                    'assets/images/toggle_light.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (!_isDark) // Aquí agregamos la condición para mostrar AvatarScreen
            AvatarScreen(), // Mostrar AvatarScreen si _isDark es false
        ],
      ),
    );
  }
}
