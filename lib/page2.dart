import 'package:flutter/material.dart';
import 'page3.dart';
import 'page4.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // --------------------------------------------------
  // TEXT CONTROLLERS
  // --------------------------------------------------

  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  // --------------------------------------------------
  // VARIABLES
  // --------------------------------------------------

  bool rememberMe = false;
  bool hidePassword = true;

  // --------------------------------------------------
  // CLEAN UP
  // --------------------------------------------------

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // --------------------------------------------------
  // LOGIN
  // --------------------------------------------------

  void login() {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please enter your email/mobile number and password.',
          ),
        ),
      );

      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Login button pressed!'),
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
  // DECORATIVE UNDERLINE
  // --------------------------------------------------

  Widget decorativeLine() {
    return SizedBox(
      height: 18,
      width: 190,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 1.2,
              color: const Color(0xFF8B4038),
            ),
          ),

          const SizedBox(width: 8),

          Transform.rotate(
            angle: 0.785398,
            child: Container(
              width: 9,
              height: 9,
              decoration: const BoxDecoration(
                color: Color(0xFFD5A94F),
              ),
            ),
          ),

          const SizedBox(width: 8),

          Expanded(
            child: Container(
              height: 1.2,
              color: const Color(0xFF8B4038),
            ),
          ),
        ],
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
                              color: Colors.black.withValues(alpha: 0.12),
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

                    // ==================================
                    // LOGO + TAGLINE
                    // ==================================

                    Positioned(
                      top: screenHeight * 0.08,
                      left: 0,
                      right: 0,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Image.asset(
                            'assets/logo.png',
                            width: 185,
                            fit: BoxFit.contain,
                          ),

                          const SizedBox(height: 8),

                          const Text(
                            'Reconnect with the Roots',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.4,
                              color: Color(0xFF7B4038),
                            ),
                          ),

                          const SizedBox(height: 5),

                          decorativeLine(),
                        ],
                      ),
                    ),

                    // ==================================
                    // LOGIN CARD
                    // ==================================

                    Positioned(
                      left: 24,
                      right: 24,
                      bottom: 20,

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
                          borderRadius: BorderRadius.circular(32),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.08),
                              blurRadius: 18,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),

                        child: SingleChildScrollView(
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,

                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: [

                              // ==============================
                              // TITLE
                              // ==============================

                              const Text(
                                'Welcome Back!',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF24443C),
                                  height: 1.1,
                                ),
                              ),

                              const SizedBox(height: 0),

                              // ==============================
                              // SUBTITLE
                              // ==============================

                              const Text(
                                'Log in to continue your journey\nwith Vyom.',
                                style: TextStyle(
                                  fontSize: 17,
                                  height: 1.25,
                                  color: Color(0xFF77716F),
                                ),
                              ),

                              const SizedBox(height: 12),

                              // ==============================
                              // EMAIL FIELD
                              // ==============================

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
                                      color: Color(0xFFF0C5C7),
                                    ),
                                  ),

                                  enabledBorder:
                                      OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(32),

                                    borderSide:
                                        const BorderSide(
                                      color: Color(0xFFF0C5C7),
                                    ),
                                  ),

                                  focusedBorder:
                                      OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(32),

                                    borderSide:
                                        const BorderSide(
                                      color: Color(0xFFD56369),
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 8),

                              // ==============================
                              // PASSWORD FIELD
                              // ==============================

                              TextField(
                                controller:
                                    passwordController,

                                obscureText: hidePassword,

                                decoration: InputDecoration(
                                  hintText: 'Password',

                                  hintStyle: const TextStyle(
                                    color: Color(0xFF77716F),
                                  ),

                                  prefixIcon:
                                      circularInputIcon(
                                    Icons.lock_outline,
                                  ),

                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        hidePassword =
                                            !hidePassword;
                                      });
                                    },

                                    icon: Icon(
                                      hidePassword
                                          ? Icons
                                              .visibility_outlined
                                          : Icons
                                              .visibility_off_outlined,

                                      color:
                                          const Color(0xFF777F81),
                                    ),
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
                                      color: Color(0xFFF0C5C7),
                                    ),
                                  ),

                                  enabledBorder:
                                      OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(32),

                                    borderSide:
                                        const BorderSide(
                                      color: Color(0xFFF0C5C7),
                                    ),
                                  ),

                                  focusedBorder:
                                      OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(32),

                                    borderSide:
                                        const BorderSide(
                                      color: Color(0xFFD56369),
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 2),

                              // ==============================
                              // REMEMBER ME / FORGOT PASSWORD
                              // ==============================

                              Row(
                                children: [

                                  Checkbox(
                                    value: rememberMe,

                                    visualDensity:
                                        VisualDensity.compact,

                                    activeColor:
                                        const Color(0xFFD56369),

                                    onChanged: (value) {
                                      setState(() {
                                        rememberMe =
                                            value ?? false;
                                      });
                                    },
                                  ),

                                  const Text(
                                    'Remember Me',
                                    style: TextStyle(
                                      color: Color(0xFF77716F),
                                      fontSize: 15,
                                    ),
                                  ),

                                  const Spacer(),

                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ForgotPasswordPage(),
                                        ),
                                      );
                                    },

                                    child: const Text(
                                      'Forgot Password?',

                                      style: TextStyle(
                                        color:
                                            Color(0xFFD56369),

                                        fontSize: 15,

                                        decoration:
                                            TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 2),

                              // ==============================
                              // LOGIN BUTTON
                              // ==============================

                              SizedBox(
                                width: double.infinity,
                                height: 54,

                                child: ElevatedButton(
                                  onPressed: login,

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
                                        'Log In',

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

                              // ==============================
                              // OR DIVIDER
                              // ==============================

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

                              // ==============================
                              // CREATE ACCOUNT
                              // ==============================

                              SizedBox(
                                width: double.infinity,
                                height: 52,

                                child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const CreateAccountPage(),
                                      ),
                                    );
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
                                    'Create New Account',

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