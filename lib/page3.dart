import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() =>
      _ForgotPasswordPageState();
}

class _ForgotPasswordPageState
    extends State<ForgotPasswordPage> {

  // --------------------------------------------------
  // TEXT CONTROLLER
  // --------------------------------------------------

  final TextEditingController emailController =
      TextEditingController();

  // --------------------------------------------------
  // CLEAN UP
  // --------------------------------------------------

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  // --------------------------------------------------
  // RESET PASSWORD
  // --------------------------------------------------

  void sendResetLink() {
    final email = emailController.text.trim();

    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please enter your email/mobile number.',
          ),
        ),
      );

      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Reset link sent!'),
      ),
    );
  }

  // --------------------------------------------------
  // CIRCULAR INPUT ICON
  // --------------------------------------------------

  Widget circularInputIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: Container(
        width: 36,
        height: 36,
        decoration: const BoxDecoration(
          color: Color(0xFFFFE7E7),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: const Color(0xFFD56369),
          size: 20,
        ),
      ),
    );
  }

  // --------------------------------------------------
  // MAIN UI
  // --------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,

      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenHeight = constraints.maxHeight;

          // Full screen height remains unchanged
          // when the keyboard opens.
          final fullScreenHeight =
              MediaQuery.of(context).size.height;

          final keyboardHeight =
              MediaQuery.of(context).viewInsets.bottom;

          final keyboardOpen = keyboardHeight > 0;

          return Stack(
            children: [

              // ======================================
              // FULL SCREEN BACKGROUND
              // ======================================

              Positioned.fill(
                child: Image.asset(
                  'assets/bg/bg2.jpg',
                  fit: BoxFit.cover,
                ),
              ),

              // ======================================
              // VERY LIGHT OVERLAY
              // ======================================

              Positioned.fill(
                child: Container(
                  color: Colors.black.withValues(alpha: 0.04),
                ),
              ),

              // ======================================
              // FOREGROUND CONTENT
              // ======================================

              SafeArea(
                child: Stack(
                  children: [

                    // ==================================
                    // BACK BUTTON
                    // ==================================

                    Positioned(
                      top: 8,
                      left: 12,
                      child: Container(
                        width: 46,
                        height: 46,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withValues(alpha: 0.12),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            if (Navigator.canPop(context)) {
                              Navigator.pop(context);
                            }
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 26,
                            color: Color(0xFF8B4038),
                          ),
                        ),
                      ),
                    ),

                    // ==================================
                    // FORGOT PASSWORD TITLE
                    // ==================================

                    Positioned(
                      left: 24,
                      right: 24,
                      top: screenHeight * 0.16,
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Forgot\n',
                              style: TextStyle(
                                fontFamily: 'Georgia',
                                fontSize: 38,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF24443C),
                                height: 0.98,
                              ),
                            ),
                            TextSpan(
                              text: 'Password?',
                              style: TextStyle(
                                fontFamily: 'Georgia',
                                fontSize: 38,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFD56369),
                                height: 0.98,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // ==================================
                    // DESCRIPTION
                    // ==================================

                    Positioned(
                      left: 24,
                      right: 24,

                      // Uses full screen height so the
                      // description does not move when
                      // the keyboard opens.
                      top: fullScreenHeight * 0.255,

                      child: const Text(
                        "No worries! Enter your registered\n"
                        "email or mobile number and we'll\n"
                        "send you a reset link.",
                        style: TextStyle(
                          fontSize: 17,
                          height: 1.25,
                          color: Color(0xFF77716F),
                        ),
                      ),
                    ),

                    // ==================================
                    // FORGOT PASSWORD FORM CARD
                    // ==================================

                    AnimatedPositioned(
                      duration:
                          const Duration(milliseconds: 180),
                      curve: Curves.easeOut,

                      left: 24,
                      right: 24,

                      bottom: keyboardOpen
                          ? screenHeight * 0.28
                          : screenHeight * 0.18,

                      child: Container(
                        width: double.infinity,

                        constraints: BoxConstraints(
                          maxHeight: screenHeight - 40,
                        ),

                        padding: const EdgeInsets.fromLTRB(
                          28,
                          22,
                          28,
                          18,
                        ),

                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF9F4),
                          borderRadius:
                              BorderRadius.circular(32),

                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withValues(alpha: 0.08),
                              blurRadius: 18,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),

                        child: SingleChildScrollView(
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior
                                  .onDrag,

                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: [

                              // ==================================
                              // EMAIL / MOBILE INPUT
                              // ==================================

                              TextField(
                                controller: emailController,
                                keyboardType:
                                    TextInputType.emailAddress,

                                decoration: InputDecoration(
                                  hintText:
                                      'Email or Mobile Number',

                                  hintStyle: const TextStyle(
                                    color: Color(0xFF77716F),
                                  ),

                                  prefixIcon:
                                      circularInputIcon(
                                    Icons.email_outlined,
                                  ),

                                  filled: true,

                                  fillColor:
                                      const Color(0xFFFFFAF7),

                                  contentPadding:
                                      const EdgeInsets.symmetric(
                                    vertical: 14,
                                    horizontal: 16,
                                  ),

                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(32),
                                    borderSide:
                                        const BorderSide(
                                      color:
                                          Color(0xFFF0C5C7),
                                    ),
                                  ),

                                  enabledBorder:
                                      OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(32),
                                    borderSide:
                                        const BorderSide(
                                      color:
                                          Color(0xFFF0C5C7),
                                    ),
                                  ),

                                  focusedBorder:
                                      OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(32),
                                    borderSide:
                                        const BorderSide(
                                      color:
                                          Color(0xFFD56369),
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 8),

                              // ==================================
                              // SEND RESET LINK BUTTON
                              // ==================================

                              SizedBox(
                                width: double.infinity,
                                height: 54,

                                child: ElevatedButton(
                                  onPressed: sendResetLink,

                                  style:
                                      ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color(0xFFD56369),
                                    foregroundColor:
                                        Colors.white,
                                    elevation: 0,

                                    shape:
                                        RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(32),
                                    ),
                                  ),

                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceBetween,

                                    children: [
                                      SizedBox(width: 20),

                                      Text(
                                        'Send Reset Link',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),

                                      Icon(
                                        Icons.arrow_forward,
                                        size: 28,
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              const SizedBox(height: 9),

                              // ==================================
                              // OR DIVIDER
                              // ==================================

                              Row(
                                children: [
                                  const Expanded(
                                    child: Divider(
                                      color:
                                          Color(0xFFD8D0CB),
                                    ),
                                  ),

                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(
                                      horizontal: 15,
                                    ),
                                    child: Text(
                                      'OR',
                                      style: TextStyle(
                                        color:
                                            Color(0xFF77716F),
                                      ),
                                    ),
                                  ),

                                  const Expanded(
                                    child: Divider(
                                      color:
                                          Color(0xFFD8D0CB),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 9),

                              // ==================================
                              // BACK TO LOGIN BUTTON
                              // ==================================

                              SizedBox(
                                width: double.infinity,
                                height: 52,

                                child: OutlinedButton(
                                  onPressed: () {
                                    if (Navigator.canPop(
                                      context,
                                    )) {
                                      Navigator.pop(context);
                                    }
                                  },

                                  style:
                                      OutlinedButton.styleFrom(
                                    foregroundColor:
                                        const Color(0xFFD56369),

                                    side: const BorderSide(
                                      color:
                                          Color(0xFFD56369),
                                      width: 1.5,
                                    ),

                                    shape:
                                        RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(32),
                                    ),
                                  ),

                                  child: const Text(
                                    'Back to Login',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight:
                                          FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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