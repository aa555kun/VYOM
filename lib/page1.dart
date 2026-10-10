import 'package:flutter/material.dart';
import 'package:vyom/page2.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [

          // =====================================================
          // BACKGROUND
          // =====================================================

          Positioned.fill(
            child: Image.asset(
              'assets/bg/bg1.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // =====================================================
          // LOGO + TAGLINE
          // =====================================================

          Positioned(
            top: size.height * 0.14,
            left: 15,
            right: 15,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                // LARGER LOGO
                Image.asset(
                  'assets/logo.png',
                  width: size.width * 0.50,
                ),

                const SizedBox(height: 12),

                // TAGLINE
                const Text(
                  "Unlock India's Stories",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF51351F),
                  ),
                ),
              ],
            ),
          ),

          // =====================================================
          // LOWER CONTENT
          // =====================================================

          Positioned(
            left: 30,
            right: 30,
            bottom: size.height * 0.14,
            child: Column(
              children: [

                // START JOURNEY BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 62,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF009B63),
                      foregroundColor: Colors.white,
                      elevation: 0,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                        side: const BorderSide(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                    ),

                    child: const Text(
                      'Start Journey  →',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // DESCRIPTION
                const Text(
                  'Play, explore and discover the rich\n'
                  'heritage, toys and traditions of India!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF49321F),
                    height: 1.35,
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