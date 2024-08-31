import 'package:flutter/material.dart';
import 'package:flutter_application_lotto/admin.dart';
import 'package:flutter_application_lotto/home.dart';
import 'package:flutter_application_lotto/register.dart';
import 'package:flutter_application_lotto/wallet.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stroke_text/stroke_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool _isEmailFocused = false;
  bool _isPasswordFocused = false;
  String _emailText = '';
  String _passwordText = '';

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() {
      setState(() {
        _isEmailFocused = _emailFocusNode.hasFocus;
      });
    });
    _passwordFocusNode.addListener(() {
      setState(() {
        _isPasswordFocused = _passwordFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C2D48),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/logo.png',
              height: 120,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 323,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF4B6382),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      'USER LOGIN',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFFE3C39D),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Stack(
                      children: [
                        TextField(
                          focusNode: _emailFocusNode,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/email_icon.png', // Path to your PNG file
                                width: 24,
                                height: 24,
                              ),
                            ),
                            hintText: '',
                            hintStyle: const TextStyle(
                              color: Colors.transparent,
                              fontSize: 12,
                            ),
                            filled: true,
                            fillColor: const Color(0xFFD1B48C),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Color(0xFFE3C39D),
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Color(0xFFE3C39D),
                                width: 2,
                              ),
                            ),
                          ),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                          onChanged: (text) {
                            setState(() {
                              _emailText = text;
                            });
                          },
                        ),
                        Positioned(
                          left: 45,
                          top: 16.5,
                          child: AnimatedOpacity(
                            opacity: _isEmailFocused || _emailText.isNotEmpty
                                ? 0.0
                                : 1.0,
                            duration: const Duration(milliseconds: 300),
                            child: StrokeText(
                              text: 'EMAIL',
                              strokeColor: const Color(0xFFE3C39D),
                              strokeWidth: 2,
                              textStyle: GoogleFonts.dmSans(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Stack(
                      children: [
                        TextField(
                          obscureText: true,
                          focusNode: _passwordFocusNode,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(
                                'assets/images/password_icon.png', // Path to your PNG file
                                width: 24,
                                height: 24,
                              ),
                            ),
                            hintText: '',
                            hintStyle: const TextStyle(
                              color: Colors.transparent,
                              fontSize: 12,
                            ),
                            filled: true,
                            fillColor: const Color(0xFFD1B48C),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Color(0xFFE3C39D),
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Color(0xFFE3C39D),
                                width: 2,
                              ),
                            ),
                          ),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                          onChanged: (text) {
                            setState(() {
                              _passwordText = text;
                            });
                          },
                        ),
                        Positioned(
                          left: 45,
                          top: 17,
                          child: AnimatedOpacity(
                            opacity:
                                _isPasswordFocused || _passwordText.isNotEmpty
                                    ? 0.0
                                    : 1.0,
                            duration: const Duration(milliseconds: 300),
                            child: StrokeText(
                              text: 'PASSWORD',
                              strokeColor: const Color(0xFFE3C39D),
                              strokeWidth: 2,
                              textStyle: GoogleFonts.dmSans(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WalletPage()),
                          );
                        },
                        child: Text(
                          'Forget password?',
                          style: GoogleFonts.dmSans(
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                offset: const Offset(0, 4),
                                blurRadius: 4,
                                color: Colors.black.withOpacity(0.25),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF071739),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 0,
                                vertical: 10,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'สมัครสมาชิก',
                                style: GoogleFonts.kanit(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Expanded(
                        //   child: ElevatedButton(
                        //     onPressed: () {
                        //       Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => HomePage()),
                        //       );
                        //       // Handle login
                        //     },
                        //     style: ElevatedButton.styleFrom(
                        //       backgroundColor: const Color(0xFF92A3BB),
                        //       padding: const EdgeInsets.symmetric(
                        //         horizontal: 0,
                        //         vertical: 10,
                        //       ),
                        //     ),
                        //     child: Align(
                        //       alignment: Alignment.center,
                        //       child: Text(
                        //         'เข้าสู่ระบบ',
                        //         style: GoogleFonts.kanit(
                        //           fontSize: 18,
                        //           fontWeight: FontWeight.bold,
                        //           color: Colors.white,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Check if both email and password contain the letter "j"
                              if (_emailText.contains('j') &&
                                  _passwordText.contains('j')) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AdminPage(
                                        name:
                                            _emailText), // Pass email as the name
                                  ),
                                );
                              } else if (_emailText.isEmpty &&
                                  _passwordText.isEmpty) {
                                // Navigate to HomePage if both email and password fields are empty
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                );
                              } else {
                                // Show an alert or error message if needed
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Email and password must contain the letter "j" or be empty to go to HomePage.',
                                      style: GoogleFonts.dmSans(),
                                    ),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF92A3BB),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 0,
                                vertical: 10,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'เข้าสู่ระบบ',
                                style: GoogleFonts.kanit(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
