import 'package:flutter/material.dart';

// Login page
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

// State of the Login Page
class _LoginPageState extends State<LoginPage> {
  // Controls whether the password is hidden or visible
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    // Get the size of the device screen
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        // Make the background cover the complete screen
        width: double.infinity,
        height: double.infinity,

        // Background image
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg/bg2.jpg'),
            fit: BoxFit.cover,
          ),
        ),

        child: SafeArea(
          // Allows the page to scroll on smaller screens
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30),

            child: ConstrainedBox(
              // Makes sure the content fills the screen height
              constraints: BoxConstraints(
                minHeight: size.height -
                    MediaQuery.of(context).padding.top,
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Space at the top of the screen
                  SizedBox(height: size.height * 0.15),

                  // =========================
                  // WELCOME + BACK
                  // =========================
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // "Welcome" text
                      const Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF164D2F),
                        ),
                      ),

                      // "Back!" text
                      // Moved slightly upward to reduce the gap
                      Transform.translate(
                        offset: const Offset(0, -15),
                        child: const Text(
                          'Back!',
                          style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFC74755),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Move subtitle upward to sit closer to the heading
                  Transform.translate(
                    offset: const Offset(0, -15),
                    child: const Text(
                      'Play, Learn and Explore\nIndia’s Heritage.',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF49321F),
                        height: 1.3,
                      ),
                    ),
                  ),

                  // Space before the login box
                  const SizedBox(height: 28),

                  // =========================
                  // LOGIN FORM BOX
                  // =========================
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(22),

                    // White translucent rounded box
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.85),
                      borderRadius: BorderRadius.circular(30),
                    ),

                    child: Column(
                      children: [
                        // =========================
                        // EMAIL / MOBILE FIELD
                        // =========================
                        TextField(
                          keyboardType: TextInputType.emailAddress,

                          decoration: InputDecoration(
                            hintText: 'Email / Mobile Number',

                            // Email icon inside a pink circle
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Container(
                                width: 40,
                                height: 40,

                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(
                                    255,
                                    255,
                                    192,
                                    192,
                                  ),
                                  shape: BoxShape.circle,
                                ),

                                child: const Icon(
                                  Icons.email_outlined,
                                  color: Color.fromARGB(
                                    255,
                                    73,
                                    31,
                                    31,
                                  ),
                                  size: 20,
                                ),
                              ),
                            ),

                            // White field background
                            filled: true,
                            fillColor:
                                Colors.white.withValues(alpha: 0.9),

                            // Rounded field
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none,
                            ),

                            // Vertical spacing inside field
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 18,
                            ),
                          ),
                        ),

                        // Space between email and password
                        const SizedBox(height: 15),

                        // =========================
                        // PASSWORD FIELD
                        // =========================
                        TextField(
                          // Hide/show password
                          obscureText: _obscurePassword,

                          decoration: InputDecoration(
                            hintText: 'Password',

                            // Lock icon inside a cream circle
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Container(
                                width: 40,
                                height: 40,

                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(
                                    255,
                                    255,
                                    237,
                                    194,
                                  ),
                                  shape: BoxShape.circle,
                                ),

                                child: const Icon(
                                  Icons.lock_outline,
                                  color: Color(0xFF49321F),
                                  size: 20,
                                ),
                              ),
                            ),

                            // Eye button to show/hide password
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscurePassword =
                                      !_obscurePassword;
                                });
                              },

                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: const Color(0xFF49321F),
                              ),
                            ),

                            // White field background
                            filled: true,
                            fillColor:
                                Colors.white.withValues(alpha: 0.9),

                            // Rounded field
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none,
                            ),

                            // Vertical spacing inside field
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 18,
                            ),
                          ),
                        ),

                        // Space below password field
                        const SizedBox(height: 8),

                        // =========================
                        // FORGOT PASSWORD
                        // =========================
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // Forgot password action
                            },
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Color(0xFFC74755),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),

                        // Space before login button
                        const SizedBox(height: 5),

                        // =========================
                        // LOGIN BUTTON
                        // =========================
                        SizedBox(
                          width: double.infinity,
                          height: 58,

                          child: ElevatedButton(
                            onPressed: () {
                              // Login action
                            },

                            style: ElevatedButton.styleFrom(
                              // Green button
                              backgroundColor:
                                  const Color(0xFF009B63),

                              // White text
                              foregroundColor: Colors.white,

                              // Remove button shadow
                              elevation: 0,

                              // Rounded button with white border
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(30),
                                side: const BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                            ),

                            child: const Text(
                              'Log In  →',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        // Space below login button
                        const SizedBox(height: 20),

                        // =========================
                        // OR DIVIDER
                        // =========================
                        Row(
                          children: [
                            // Left line
                            Expanded(
                              child: Divider(
                                color: Colors.grey.shade400,
                                thickness: 1,
                              ),
                            ),

                            // OR text
                            const Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                'OR',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                            // Right line
                            Expanded(
                              child: Divider(
                                color: Colors.grey.shade400,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),

                        // Space below OR
                        const SizedBox(height: 15),

                        // =========================
                        // CREATE ACCOUNT
                        // =========================
                        TextButton(
                          onPressed: () {
                            // Create account action
                          },
                          child: const Text(
                            'New here? Create Account',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF009B63),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Bottom spacing
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}