
import 'package:flutter/material.dart';

class CreateAvatarPage extends StatefulWidget {
  const CreateAvatarPage({super.key});

  @override
  State<CreateAvatarPage> createState() =>
      _CreateAvatarPageState();
}

class _CreateAvatarPageState extends State<CreateAvatarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenHeight = constraints.maxHeight;

          return Stack(
            children: [

              // ======================================
              // FULL SCREEN BACKGROUND
              // ======================================

              Positioned.fill(
                child: Image.asset(
                  'assets/bg/bg3.png',
                  fit: BoxFit.cover,
                ),
              ),

              // ======================================
              // VERY LIGHT OVERLAY
              // ======================================

              Positioned.fill(
                child: Container(
                  color: Colors.black.withValues(alpha: 0.02),
                ),
              ),

              // ======================================
              // FOREGROUND CONTENT
              // ======================================

              SafeArea(
                child: Stack(
                  children: [

                    // ==================================
                    // TITLE BOARD + TEXT
                    // ==================================

                    Positioned(
                      top: screenHeight * 0.055,
                      left: 20,
                      right: 20,
                      child: SizedBox(
                        height: screenHeight * 0.22,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [

                            // TITLE BOARD

                            Image.asset(
                              'assets/elements/board1.png',
                              width: constraints.maxWidth * 0.85,
                              height: screenHeight * 0.22,
                              fit: BoxFit.contain,
                            ),

                            // TITLE TEXT

                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [

                                const Text(
                                  'Customize Your',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF155E49),
                                    height: 1.1,
                                  ),
                                ),

                                const Text(
                                  'Avatar',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFC65359),
                                    height: 1.1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    // ==================================
                    // AVATAR STAGE
                    // ==================================

                    Positioned(
                      left: 0,
                      right: 0,
                      top: screenHeight * 0.43,
                      child: Center(
                        child: Image.asset(
                          'assets/elements/stage.png',
                          width: constraints.maxWidth * 0.78,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
