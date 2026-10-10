import 'dart:ui';

import 'package:flutter/material.dart';

class CreateProfilePage extends StatefulWidget {
  const CreateProfilePage({super.key});

  @override
  State<CreateProfilePage> createState() =>
      _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  // --------------------------------------------------
  // TEXT CONTROLLER
  // --------------------------------------------------

  final TextEditingController usernameController =
      TextEditingController();

  // --------------------------------------------------
  // PAGE STATE
  // --------------------------------------------------

  int age = 10;

  // --------------------------------------------------
  // COLORS
  // --------------------------------------------------

  static const Color darkGreen = Color(0xFF24443C);
  static const Color rose = Color(0xFFC85D66);
  static const Color inputBorder = Color(0xFFF0C5C7);
  static const Color inputBackground = Color(0xFFFFFAF7);
  static const Color iconBackground = Color(0xFFFFE7E7);
  static const Color iconColor = Color(0xFFD56369);
  static const Color textColor = Color(0xFF77716F);
  static const Color dividerColor = Color(0xFFE6A16A);

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  // --------------------------------------------------
  // REUSABLE INPUT ICON
  // --------------------------------------------------

  Widget circularInputIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: Container(
        width: 36,
        height: 36,
        decoration: const BoxDecoration(
          color: iconBackground,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: 20,
        ),
      ),
    );
  }

  // --------------------------------------------------
  // USERNAME FIELD
  // --------------------------------------------------

  Widget usernameField() {
    return SizedBox(
      height: 58,
      child: TextField(
        controller: usernameController,
        textCapitalization: TextCapitalization.none,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: 'Choose a Username',
          hintStyle: const TextStyle(
            color: textColor,
            fontSize: 15,
          ),
          prefixIcon: circularInputIcon(
            Icons.person_outline,
          ),
          filled: true,
          fillColor: inputBackground,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: const BorderSide(
              color: inputBorder,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: const BorderSide(
              color: inputBorder,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: const BorderSide(
              color: iconColor,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }

  // --------------------------------------------------
  // AGE SELECTOR
  // --------------------------------------------------

  Widget ageSelector() {
    return SizedBox(
      height: 62,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: inputBackground,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(
            color: inputBorder,
          ),
        ),
        child: Row(
          children: [
            circularInputIcon(
              Icons.calendar_month_outlined,
            ),

            const SizedBox(width: 5),

            const Expanded(
              child: Text(
                'Your Age',
                style: TextStyle(
                  color: textColor,
                  fontSize: 15,
                ),
              ),
            ),

            ageButton(
              icon: Icons.remove,
              onPressed: () {
                if (age > 1) {
                  setState(() {
                    age--;
                  });
                }
              },
            ),

            SizedBox(
              width: 45,
              child: Center(
                child: Text(
                  '$age',
                  style: const TextStyle(
                    color: Color(0xFF343434),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            ageButton(
              icon: Icons.add,
              onPressed: () {
                if (age < 99) {
                  setState(() {
                    age++;
                  });
                }
              },
            ),

            const SizedBox(width: 5),
          ],
        ),
      ),
    );
  }

  Widget ageButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: 40,
      height: 40,
      child: Material(
        color: const Color(0xFFF8E5DB),
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onPressed,
          child: Icon(
            icon,
            color: const Color(0xFF8B4038),
            size: 23,
          ),
        ),
      ),
    );
  }

  // --------------------------------------------------
  // EXPLORE BUTTON
  // --------------------------------------------------

  Widget exploreButton(double scale) {
    return SizedBox(
      height: 58,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF078C66),
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color: const Color(0xFF075D48),
            width: 2.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.16),
              blurRadius: 5,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(40),
          child: InkWell(
            borderRadius: BorderRadius.circular(40),
            onTap: continueToExplore,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Center the label independently of the arrow.
                const Center(
                  child: Text(
                    "Let's Explore!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Arrow matches the back arrow's icon size.
                Positioned(
                  right: 18 * scale,
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --------------------------------------------------
  // DECORATIVE DIVIDER WITH STAR
  // --------------------------------------------------

  Widget decorativeDivider(double scale) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 35 * scale,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 1.5 * scale,
              color: dividerColor,
            ),
          ),

          SizedBox(width: 10 * scale),

          Icon(
            Icons.star,
            color: dividerColor,
            size: 20 * scale,
          ),

          SizedBox(width: 10 * scale),

          Expanded(
            child: Container(
              height: 1.5 * scale,
              color: dividerColor,
            ),
          ),
        ],
      ),
    );
  }

  // --------------------------------------------------
  // VALIDATION
  // --------------------------------------------------

  void continueToExplore() {
    FocusScope.of(context).unfocus();

    if (usernameController.text.trim().isEmpty) {
      showMessage('Please choose a username.');
      return;
    }

    // Placeholder until profile saving and navigation
    // to the next page are connected.
    showMessage(
      'Profile details ready: '
      '${usernameController.text.trim()}, age $age.',
    );
  }

  // --------------------------------------------------
  // SNACKBAR MESSAGE
  // --------------------------------------------------

  void showMessage(String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  // --------------------------------------------------
  // PAGE UI
  // --------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;

          // Profile card aspect ratio: 680 x 1024.
          final cardWidth = screenWidth - 32;
          final cardHeight = cardWidth * (1024 / 680);

          final availableCardHeight = screenHeight - 100;

          final fittedCardWidth =
              cardHeight > availableCardHeight
                  ? availableCardHeight * (680 / 1024)
                  : cardWidth;

          final fittedCardHeight =
              fittedCardWidth * (1024 / 680);

          final scale = fittedCardWidth / 680;

          return Stack(
            children: [
              // ------------------------------------------
              // BLURRED BACKGROUND
              // ------------------------------------------

              Positioned.fill(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: 5,
                    sigmaY: 5,
                  ),
                  child: Image.asset(
                    'assets/bg/bg2.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // ------------------------------------------
              // SUBTLE OVERLAY
              // ------------------------------------------

              Positioned.fill(
                child: Container(
                  color: Colors.black.withValues(
                    alpha: 0.04,
                  ),
                ),
              ),

              // ------------------------------------------
              // BACK BUTTON
              // ------------------------------------------

              SafeArea(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                      top: 8,
                    ),
                    child: Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(
                              alpha: 0.12,
                            ),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 26,
                          color: Color(0xFF8B4038),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // ------------------------------------------
              // PROFILE CARD AND CONTENT
              // ------------------------------------------

              Center(
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                  ),
                  child: SizedBox(
                    width: fittedCardWidth,
                    height: fittedCardHeight,
                    child: Stack(
                      children: [
                        // Profile card artwork.
                        Positioned.fill(
                          child: Image.asset(
                            'assets/images/profile_card.png',
                            fit: BoxFit.fill,
                          ),
                        ),

                        // ----------------------------------
                        // CONTENT COLUMN
                        // ----------------------------------

                        Positioned(
                          top: 315 * scale,
                          left: 28 * scale,
                          right: 28 * scale,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // HEADING
                              Text(
                                'Create Your',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 50 * scale,
                                  fontWeight: FontWeight.w800,
                                  height: 1.0,
                                  color: darkGreen,
                                ),
                              ),

                              SizedBox(height: 4 * scale),

                              Text(
                                'Player Profile',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 50 * scale,
                                  fontWeight: FontWeight.w800,
                                  height: 1.0,
                                  color: rose,
                                ),
                              ),

                              SizedBox(height: 8 * scale),

                              Container(
                                width: 100 * scale,
                                height: 4 * scale,
                                decoration: BoxDecoration(
                                  color: dividerColor,
                                  borderRadius:
                                      BorderRadius.circular(10),
                                ),
                              ),

                              SizedBox(height: 24 * scale),

                              // USERNAME FIELD
                              usernameField(),

                              SizedBox(height: 10 * scale),

                              // AGE SELECTOR
                              ageSelector(),

                              SizedBox(height: 18 * scale),

                              // EXPLORE BUTTON
                              SizedBox(
                                width: 460 * scale,
                                child: exploreButton(scale),
                              ),

                              SizedBox(height: 16 * scale),

                              // DECORATIVE STAR DIVIDER
                              decorativeDivider(scale),

                              SizedBox(height: 12 * scale),

                              // LARGER FOOTER TEXT
                              Text(
                                'Your journey through India starts here',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 23 * scale,
                                  color: const Color(0xFF8B4038),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}