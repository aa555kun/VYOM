
import 'package:flutter/material.dart';

class CreateAvatarPage extends StatefulWidget {
  const CreateAvatarPage({super.key});

  @override
  State<CreateAvatarPage> createState() => _CreateAvatarPageState();
}

class _CreateAvatarPageState extends State<CreateAvatarPage> {
  // --------------------------------------------------
  // AVATAR BASES
  // --------------------------------------------------

  final List<String> avatarBases = [
    'assets/avatar/base/base1.png',
    'assets/avatar/base/base2.png',
    'assets/avatar/base/base3.png',
    'assets/avatar/base/base4.png',
    'assets/avatar/base/base5.png',
    'assets/avatar/base/base6.png',
  ];

  // --------------------------------------------------
  // HAIRSTYLES
  // --------------------------------------------------

  final List<String> hairstyles = [
    'assets/avatar/hairstyle/hair1.png',
    'assets/avatar/hairstyle/hair2.png',
    'assets/avatar/hairstyle/hair3.png',
    'assets/avatar/hairstyle/hair4.png',
    'assets/avatar/hairstyle/hair5.png',
    'assets/avatar/hairstyle/hair6.png',
  ];

  // --------------------------------------------------
  // SKIN TONE COLORS
  // --------------------------------------------------

  final List<Color> skinToneColors = [
    const Color(0xFFF8DCC0),
    const Color(0xFFECC29B),
    const Color(0xFFDCA579),
    const Color(0xFFC58A60),
    const Color(0xFFA96F4C),
    const Color(0xFF805035),
  ];

  // --------------------------------------------------
  // SELECTED OPTIONS
  // --------------------------------------------------

  int selectedBaseIndex = 0;
  int selectedHairIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;

          return Stack(
            fit: StackFit.expand,
            children: [
              // Background
              Image.asset(
                'assets/bg/bg3.png',
                fit: BoxFit.cover,
              ),

              // Subtle background overlay
              Container(
                color: Colors.black.withValues(alpha: 0.02),
              ),

              SafeArea(
                child: Stack(
                  children: [
                    // --------------------------------------------------
                    // 1. TITLE BOX — BACK
                    // --------------------------------------------------

                    Positioned(
                      top: -screenHeight * 0.025,
                      left: 30,
                      right: 30,
                      child: SizedBox(
                        height: screenHeight * 0.18,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'assets/elements/board1.png',
                              width: screenWidth * 0.75,
                              height: screenHeight * 0.18,
                              fit: BoxFit.contain,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: screenHeight * 0.005,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Create Your',
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.062,
                                      height: 1.0,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF155E49),
                                    ),
                                  ),
                                  Text(
                                    'Avatar',
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.09,
                                      height: 1.0,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFFC65359),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // --------------------------------------------------
                    // 2. STAGE — MOVED UP
                    // --------------------------------------------------

                    Positioned(
                      left: 0,
                      right: 0,
                      top: screenHeight * 0.43,
                      child: Center(
                        child: Image.asset(
                          'assets/elements/stage.png',
                          width: screenWidth * 0.78,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    // --------------------------------------------------
                    // 3. BASE AVATAR
                    // --------------------------------------------------

                    Positioned(
                      left: 0,
                      right: 0,
                      top: screenHeight * 0.11,
                      child: Center(
                        child: SizedBox(
                          height: screenHeight * 0.38,
                          child: Image.asset(
                            avatarBases[selectedBaseIndex],
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),

                    // --------------------------------------------------
                    // 4. HAIRSTYLE — TOP AVATAR LAYER
                    // --------------------------------------------------

                    Positioned(
                      left: 0,
                      right: 0,
                      top: screenHeight * 0.11,
                      child: Center(
                        child: SizedBox(
                          height: screenHeight * 0.38,
                          child: Image.asset(
                            hairstyles[selectedHairIndex],
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),

                    // --------------------------------------------------
                    // 5. CUSTOMIZATION SELECTORS
                    // --------------------------------------------------

                    Positioned(
                      left: 20,
                      right: 20,
                      bottom: screenHeight * 0.025,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // SKIN TONE SELECTOR

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF9F4),
                              borderRadius: BorderRadius.circular(28),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(
                                    alpha: 0.12,
                                  ),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // SKIN TONE HEADING WITH PALETTE ICON

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.palette_outlined,
                                      color: Color(0xFFD56369),
                                      size: 22,
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      'Choose Skin Tone',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF24443C),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 12),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: List.generate(
                                    skinToneColors.length,
                                    (index) {
                                      final isSelected =
                                          selectedBaseIndex == index;

                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedBaseIndex = index;
                                          });
                                        },
                                        child: AnimatedContainer(
                                          duration: const Duration(
                                            milliseconds: 180,
                                          ),
                                          width: screenWidth * 0.095,
                                          height: screenWidth * 0.095,
                                          decoration: BoxDecoration(
                                            color: skinToneColors[index],
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: isSelected
                                                  ? const Color(0xFFD56369)
                                                  : Colors.white,
                                              width: isSelected ? 3 : 1.5,
                                            ),
                                          ),
                                          child: isSelected
                                              ? const Icon(
                                                  Icons.check,
                                                  color: Color(0xFF24443C),
                                                  size: 18,
                                                )
                                              : null,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 8),

                          // HAIRSTYLE SELECTOR

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF9F4),
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(
                                    alpha: 0.10,
                                  ),
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // HAIRSTYLE HEADING WITH ICON

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.content_cut,
                                      color: Color(0xFFD56369),
                                      size: 22,
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      'Choose Hairstyle',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF24443C),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 10),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: List.generate(
                                    hairstyles.length,
                                    (index) {
                                      final isSelected =
                                          selectedHairIndex == index;

                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedHairIndex = index;
                                          });
                                        },
                                        child: AnimatedContainer(
                                          duration: const Duration(
                                            milliseconds: 180,
                                          ),
                                          width: screenWidth * 0.095,
                                          height: screenWidth * 0.095,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFFFAF7),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                              color: isSelected
                                                  ? const Color(0xFFD56369)
                                                  : const Color(0xFFF0C5C7),
                                              width: isSelected ? 2.5 : 1,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${index + 1}',
                                              style: const TextStyle(
                                                color: Color(0xFF24443C),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
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
