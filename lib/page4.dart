import 'package:flutter/material.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final TextEditingController nameController =
      TextEditingController();
  final TextEditingController emailController =
      TextEditingController();
  final TextEditingController passwordController =
      TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool hidePassword = true;
  bool hideConfirmPassword = true;
  bool agreedToTerms = false;

  String selectedLanguage = 'Select Language';

  @override
  void initState() {
    super.initState();

    passwordController.addListener(() {
      setState(() {});
    });

    confirmPasswordController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(
            color: Color(0xFFF0C5C7),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(
            color: Color(0xFFF0C5C7),
          ),
        ),
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

  bool get hasMinLength =>
      passwordController.text.length >= 8;

  bool get hasUppercase =>
      RegExp(r'[A-Z]').hasMatch(passwordController.text);

  bool get hasLowercase =>
      RegExp(r'[a-z]').hasMatch(passwordController.text);

  bool get hasNumber =>
      RegExp(r'[0-9]').hasMatch(passwordController.text);

  bool get hasSpecialCharacter =>
      RegExp(r'[!@#$%^&*(),.?":{}|<>_\-\\/\[\]]')
          .hasMatch(passwordController.text);

  bool get passwordsMatch =>
      passwordController.text.isNotEmpty &&
      passwordController.text ==
          confirmPasswordController.text;

  bool get passwordIsValid =>
      hasMinLength &&
      hasUppercase &&
      hasLowercase &&
      hasNumber &&
      hasSpecialCharacter;

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

  void createAccount() {
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

    showMessage(
      'All details are valid. Firebase will be connected next.',
    );
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenHeight = constraints.maxHeight;

          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/bg/bg2.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Container(
                  color: Colors.black.withValues(alpha: 0.04),
                ),
              ),
              SafeArea(
                child: Stack(
                  children: [
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

                    Positioned(
                      top: screenHeight * 0.14,
                      left: 40,
                      right: 40,
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
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
                              borderRadius:
                                  BorderRadius.circular(10),
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
                              color:
                                  Colors.black.withValues(alpha: 0.08),
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
                            children: [
                              inputField(
                                controller: nameController,
                                hintText: 'Full Name',
                                icon: Icons.person_outline,
                              ),

                              const SizedBox(height: 8),

                              languageField(),

                              const SizedBox(height: 8),

                              inputField(
                                controller: emailController,
                                hintText:
                                    'Email or Mobile Number',
                                icon: Icons.email_outlined,
                                keyboardType:
                                    TextInputType.emailAddress,
                              ),

                              const SizedBox(height: 8),

                              inputField(
                                controller: passwordController,
                                hintText: 'Password',
                                icon: Icons.lock_outline,
                                obscureText: hidePassword,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      hidePassword =
                                          !hidePassword;
                                    });
                                  },
                                  icon: Icon(
                                    hidePassword
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color:
                                        const Color(0xFF777F81),
                                  ),
                                ),
                              ),

                              passwordRequirements(),

                              const SizedBox(height: 8),

                              inputField(
                                controller:
                                    confirmPasswordController,
                                hintText: 'Confirm Password',
                                icon: Icons.lock_outline,
                                obscureText:
                                    hideConfirmPassword,
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
                                    color:
                                        const Color(0xFF777F81),
                                  ),
                                ),
                              ),

                              if (confirmPasswordController
                                      .text.isNotEmpty &&
                                  passwordController
                                      .text.isNotEmpty)
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

                              Row(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: agreedToTerms,
                                    visualDensity:
                                        VisualDensity.compact,
                                    activeColor:
                                        const Color(0xFFD56369),
                                    onChanged: (value) {
                                      setState(() {
                                        agreedToTerms =
                                            value ?? false;
                                      });
                                    },
                                  ),
                                  const Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        top: 8,
                                      ),
                                      child: Text.rich(
                                        TextSpan(
                                          style: TextStyle(
                                            color:
                                                Color(0xFF77716F),
                                            fontSize: 15,
                                            height: 1.3,
                                          ),
                                          children: [
                                            TextSpan(
                                              text:
                                                  'I agree to the ',
                                            ),
                                            TextSpan(
                                              text:
                                                  'Terms & Conditions',
                                              style: TextStyle(
                                                color:
                                                    Color(0xFFC85D66),
                                                fontWeight:
                                                    FontWeight.w600,
                                                decoration:
                                                    TextDecoration
                                                        .underline,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' and\n',
                                            ),
                                            TextSpan(
                                              text:
                                                  'Privacy Policy',
                                              style: TextStyle(
                                                color:
                                                    Color(0xFFC85D66),
                                                fontWeight:
                                                    FontWeight.w600,
                                                decoration:
                                                    TextDecoration
                                                        .underline,
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

                              SizedBox(
                                width: double.infinity,
                                height: 54,
                                child: ElevatedButton(
                                  onPressed: createAccount,
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
                                        'Create Account',
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

                              SizedBox(
                                width: double.infinity,
                                height: 52,
                                child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
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
                                  child: const Text.rich(
                                    TextSpan(
                                      style: TextStyle(
                                        fontSize: 17,
                                        color:
                                            Color(0xFF77716F),
                                      ),
                                      children: [
                                        TextSpan(
                                          text:
                                              'Already have an account? ',
                                        ),
                                        TextSpan(
                                          text: 'Log In',
                                          style: TextStyle(
                                            color:
                                                Color(0xFFD56369),
                                            fontWeight:
                                                FontWeight.w600,
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