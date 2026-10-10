import 'package:flutter/material.dart';
import 'page5.dart';


class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  // --------------------------------------------------
  // TEXT CONTROLLERS
  // --------------------------------------------------

  final TextEditingController nameController =
      TextEditingController();

  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  // --------------------------------------------------
  // PAGE STATE
  // --------------------------------------------------

  bool hidePassword = true;
  bool hideConfirmPassword = true;
  bool agreedToTerms = false;

  String selectedLanguage = 'Select Language';

  @override
  void initState() {
    super.initState();

    // Refresh password requirements while typing.
    passwordController.addListener(() {
      setState(() {});
    });

    // Refresh password-match status while typing.
    confirmPasswordController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // Dispose controllers when the page is removed.
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

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
  // REUSABLE TEXT FIELD
  // --------------------------------------------------

  Widget inputField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
    Widget? suffixIcon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xFF77716F),
        ),
        prefixIcon: circularInputIcon(icon),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: const Color(0xFFFFFAF7),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 16,
        ),

        // Default border.
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(
            color: Color(0xFFF0C5C7),
          ),
        ),

        // Border when the field is not focused.
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(
            color: Color(0xFFF0C5C7),
          ),
        ),

        // Border when the user selects the field.
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(
            color: Color(0xFFD56369),
            width: 2,
          ),
        ),
      ),
    );
  }

  // --------------------------------------------------
  // LANGUAGE SELECTION FIELD
  // --------------------------------------------------

  Widget languageField() {
    return GestureDetector(
      onTap: showLanguagePicker,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: const Color(0xFFFFFAF7),
          borderRadius: BorderRadius.circular(32),
          border: Border.all(
            color: const Color(0xFFF0C5C7),
          ),
        ),
        child: Row(
          children: [
            circularInputIcon(Icons.language),
            Expanded(
              child: Text(
                selectedLanguage,
                style: const TextStyle(
                  color: Color(0xFF77716F),
                  fontSize: 16,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 14),
              child: Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xFF8B4038),
                size: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Show the available languages in a bottom sheet.
  void showLanguagePicker() {
    final languages = [
      'English',
      'Hindi',
      'Bengali',
      'Marathi',
      'Telugu',
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFFFFF9F4),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              24,
              20,
              24,
              25,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Small handle at the top of the sheet.
                Container(
                  width: 45,
                  height: 5,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD8D0CB),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Select Language',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF24443C),
                  ),
                ),

                const SizedBox(height: 15),

                ...languages.map(
                  (language) => ListTile(
                    title: Text(language),

                    // Mark the currently selected language.
                    trailing: selectedLanguage == language
                        ? const Icon(
                            Icons.check,
                            color: Color(0xFFD56369),
                          )
                        : null,

                    onTap: () {
                      setState(() {
                        selectedLanguage = language;
                      });

                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // --------------------------------------------------
  // PASSWORD VALIDATION
  // --------------------------------------------------

  // Password must contain at least eight characters.
  bool get hasMinLength =>
      passwordController.text.length >= 8;

  // Password must contain an uppercase letter.
  bool get hasUppercase =>
      RegExp(r'[A-Z]').hasMatch(passwordController.text);

  // Password must contain a lowercase letter.
  bool get hasLowercase =>
      RegExp(r'[a-z]').hasMatch(passwordController.text);

  // Password must contain a number.
  bool get hasNumber =>
      RegExp(r'[0-9]').hasMatch(passwordController.text);

  // Password must contain at least one non-alphanumeric character.
  bool get hasSpecialCharacter =>
      RegExp(r'[^A-Za-z0-9]').hasMatch(passwordController.text);

  // Confirm password must match the original password.
  bool get passwordsMatch =>
      passwordController.text.isNotEmpty &&
      passwordController.text ==
          confirmPasswordController.text;

  // All password requirements must be satisfied.
  bool get passwordIsValid =>
      hasMinLength &&
      hasUppercase &&
      hasLowercase &&
      hasNumber &&
      hasSpecialCharacter;

  // --------------------------------------------------
  // PASSWORD REQUIREMENT INDICATOR
  // --------------------------------------------------

  Widget passwordRequirement(
    String text,
    bool satisfied,
  ) {
    return Row(
      children: [
        Icon(
          satisfied
              ? Icons.check_circle
              : Icons.circle_outlined,
          size: 17,
          color: satisfied
              ? const Color(0xFF4D9A67)
              : const Color(0xFF99918E),
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: TextStyle(
            fontSize: 13,
            color: satisfied
                ? const Color(0xFF4D9A67)
                : const Color(0xFF77716F),
          ),
        ),
      ],
    );
  }

  // Display password requirements after typing begins.
  Widget passwordRequirements() {
    if (passwordController.text.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        top: 7,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          passwordRequirement(
            'At least 8 characters',
            hasMinLength,
          ),
          const SizedBox(height: 3),
          passwordRequirement(
            'One uppercase letter',
            hasUppercase,
          ),
          const SizedBox(height: 3),
          passwordRequirement(
            'One lowercase letter',
            hasLowercase,
          ),
          const SizedBox(height: 3),
          passwordRequirement(
            'One number',
            hasNumber,
          ),
          const SizedBox(height: 3),
          passwordRequirement(
            'One special character',
            hasSpecialCharacter,
          ),
        ],
      ),
    );
  }

  // --------------------------------------------------
  // CREATE ACCOUNT VALIDATION
  // --------------------------------------------------

  void createAccount() {
    // Close the keyboard before showing validation messages.
    FocusScope.of(context).unfocus();

    if (nameController.text.trim().isEmpty) {
      showMessage('Please enter your full name.');
      return;
    }

    if (selectedLanguage == 'Select Language') {
      showMessage('Please select a language.');
      return;
    }

    if (emailController.text.trim().isEmpty) {
      showMessage(
        'Please enter your email or mobile number.',
      );
      return;
    }

    if (passwordController.text.isEmpty) {
      showMessage('Please enter a password.');
      return;
    }

    if (!passwordIsValid) {
      showMessage(
        'Please meet all password requirements.',
      );
      return;
    }

    if (confirmPasswordController.text.isEmpty) {
      showMessage('Please confirm your password.');
      return;
    }

    if (!passwordsMatch) {
      showMessage('Passwords do not match.');
      return;
    }

    if (!agreedToTerms) {
      showMessage(
        'Please agree to the Terms & Conditions and Privacy Policy.',
      );
      return;
    }

    // This is a placeholder until account creation is connected
    // to Firebase Authentication or another authentication service.
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateProfilePage(),
      ),
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

      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenHeight = constraints.maxHeight;

          return Stack(
            children: [
              // Background image shared with the authentication pages.
              Positioned.fill(
                child: Image.asset(
                  'assets/bg/bg2.jpg',
                  fit: BoxFit.cover,
                ),
              ),

              // Subtle dark overlay for readability.
              Positioned.fill(
                child: Container(
                  color: Colors.black.withValues(alpha: 0.04),
                ),
              ),

              SafeArea(
                child: Stack(
                  children: [
                    // ------------------------------------------
                    // BACK BUTTON
                    // ------------------------------------------

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

                    // ------------------------------------------
                    // PAGE HEADING
                    // ------------------------------------------

                    Positioned(
                      top: screenHeight * 0.14,
                      left: 40,
                      right: 40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Create',
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF24443C),
                              height: 0.95,
                            ),
                          ),
                          const Text(
                            'Account',
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFC85D66),
                              height: 1.0,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            width: 125,
                            height: 4,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE6A16A),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Join Vyom and explore\nIndia’s rich heritage.',
                            style: TextStyle(
                              fontSize: 17,
                              height: 1.3,
                              color: Color(0xFF77716F),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // ------------------------------------------
                    // CREATE ACCOUNT FORM CARD
                    // ------------------------------------------

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
                              color: Colors.black.withValues(
                                alpha: 0.08,
                              ),
                              blurRadius: 18,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),

                        // Allows the form to scroll on smaller screens
                        // and when the keyboard is visible.
                        child: SingleChildScrollView(
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Full name.
                              inputField(
                                controller: nameController,
                                hintText: 'Full Name',
                                icon: Icons.person_outline,
                              ),

                              const SizedBox(height: 8),

                              // Preferred language.
                              languageField(),

                              const SizedBox(height: 8),

                              // Email address or mobile number.
                              inputField(
                                controller: emailController,
                                hintText: 'Email or Mobile Number',
                                icon: Icons.email_outlined,
                                keyboardType: TextInputType.emailAddress,
                              ),

                              const SizedBox(height: 8),

                              // Password with visibility toggle.
                              inputField(
                                controller: passwordController,
                                hintText: 'Password',
                                icon: Icons.lock_outline,
                                obscureText: hidePassword,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      hidePassword = !hidePassword;
                                    });
                                  },
                                  icon: Icon(
                                    hidePassword
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: const Color(0xFF777F81),
                                  ),
                                ),
                              ),

                              // Live password requirement checklist.
                              passwordRequirements(),

                              const SizedBox(height: 8),

                              // Confirm password with visibility toggle.
                              inputField(
                                controller: confirmPasswordController,
                                hintText: 'Confirm Password',
                                icon: Icons.lock_outline,
                                obscureText: hideConfirmPassword,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      hideConfirmPassword =
                                          !hideConfirmPassword;
                                    });
                                  },
                                  icon: Icon(
                                    hideConfirmPassword
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: const Color(0xFF777F81),
                                  ),
                                ),
                              ),

                              // Show whether both passwords match.
                              if (confirmPasswordController
                                      .text.isNotEmpty &&
                                  passwordController.text.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8,
                                    top: 5,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        passwordsMatch
                                            ? Icons.check_circle
                                            : Icons.error_outline,
                                        size: 17,
                                        color: passwordsMatch
                                            ? const Color(0xFF4D9A67)
                                            : const Color(0xFFD56369),
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        passwordsMatch
                                            ? 'Passwords match'
                                            : 'Passwords do not match',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: passwordsMatch
                                              ? const Color(0xFF4D9A67)
                                              : const Color(0xFFD56369),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              const SizedBox(height: 8),

                              // Terms and privacy policy agreement.
                              Row(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: agreedToTerms,
                                    visualDensity: VisualDensity.compact,
                                    activeColor: const Color(0xFFD56369),
                                    onChanged: (value) {
                                      setState(() {
                                        agreedToTerms = value ?? false;
                                      });
                                    },
                                  ),
                                  const Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 8),
                                      child: Text.rich(
                                        TextSpan(
                                          style: TextStyle(
                                            color: Color(0xFF77716F),
                                            fontSize: 15,
                                            height: 1.3,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: 'I agree to the ',
                                            ),
                                            TextSpan(
                                              text: 'Terms & Conditions',
                                              style: TextStyle(
                                                color: Color(0xFFC85D66),
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            TextSpan(text: ' and\n'),
                                            TextSpan(
                                              text: 'Privacy Policy',
                                              style: TextStyle(
                                                color: Color(0xFFC85D66),
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 4),

                              // Create account button.
                              SizedBox(
                                width: double.infinity,
                                height: 54,
                                child: ElevatedButton(
                                  onPressed: createAccount,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color(0xFFD56369),
                                    foregroundColor: Colors.white,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(32),
                                    ),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(width: 20),
                                      Text(
                                        'Create Account',
                                        style: TextStyle(fontSize: 18),
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

                              // Divider separating the form from login.
                              Row(
                                children: [
                                  const Expanded(
                                    child: Divider(
                                      color: Color(0xFFD8D0CB),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 15,
                                    ),
                                    child: Text(
                                      'OR',
                                      style: TextStyle(
                                        color: Color(0xFF77716F),
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                    child: Divider(
                                      color: Color(0xFFD8D0CB),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 9),

                              // Return to the previous page to log in.
                              SizedBox(
                                width: double.infinity,
                                height: 52,
                                child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor:
                                        const Color(0xFFD56369),
                                    side: const BorderSide(
                                      color: Color(0xFFD56369),
                                      width: 1.5,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(32),
                                    ),
                                  ),
                                  child: const Text.rich(
                                    TextSpan(
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Color(0xFF77716F),
                                      ),
                                      children: [
                                        TextSpan(
                                          text:
                                              'Already have an account? ',
                                        ),
                                        TextSpan(
                                          text: 'Log In',
                                          style: TextStyle(
                                            color: Color(0xFFD56369),
                                            fontWeight: FontWeight.w600,
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
