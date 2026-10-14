
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
                    // PAGE TITLE
                    // ==================================

                    Positioned(
                      top: screenHeight * 0.055,
                      left: 20,
                      right: 20,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          const Text(
                            'Customize Your',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF155E49),
                              height: 1.1,
                            ),
                          ),

                          const SizedBox(height: 0),

                          const Text(
                            'Avatar',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFC65359),
                              height: 1.1,
                            ),
                          ),
                        ],
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
