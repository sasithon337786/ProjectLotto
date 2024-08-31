import 'package:flutter/material.dart';
import 'package:flutter_application_lotto/login.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121C35), // Dark blue background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              'SIGN UP',
              style: GoogleFonts.dmSans(
                fontSize: 36,
                fontWeight: FontWeight.w500,
                color: const Color(0xFFD5B489), // Gold color
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: 323,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF4B6382), // Container color
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/add_photo.png', // Replace with your image path
                    width: 80, // Adjust size as needed
                    height: 80,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'ADD PHOTO',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // NAME TextField
                  TextField(
                    style: GoogleFonts.dmSans(fontSize: 12),
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(
                            12.0), // Adjust padding as needed
                        child: Image.asset(
                          'assets/icons/person_icon.png',
                          width: 24, // Adjust size as needed
                          height: 24,
                          color: Colors.white, 
                        ),
                      ),
                      hintText: 'NAME',
                      hintStyle: GoogleFonts.dmSans(
                        color: Colors.white, 
                        fontSize: 12,
                      ),
                      filled: true,
                      fillColor:
                          const Color(0xFFD1B48C), // TextField background color
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color(0xFFF9D4B4),
                          width: 1.5,
                        ), // Stroke color
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color(0xFFF9D4B4),
                          width: 1.5,
                        ), // Stroke color
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // LAST NAME TextField
                  TextField(
                    style: GoogleFonts.dmSans(fontSize: 12),
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(
                            12.0), // Adjust padding as needed
                        child: Image.asset(
                          'assets/icons/badge_icon.png',
                          width: 24, // Adjust size as needed
                          height: 24,
                          color: Colors.white, 
                        ),
                      ),
                      hintText: 'LAST NAME',
                      hintStyle: GoogleFonts.dmSans(
                        color: Colors.white, 
                        fontSize: 12,
                      ),
                      filled: true,
                      fillColor:
                          const Color(0xFFD1B48C), // TextField background color
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color(0xFFF9D4B4),
                          width: 1.5,
                        ), // Stroke color
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color(0xFFF9D4B4),
                          width: 1.5,
                        ), // Stroke color
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // EMAIL TextField
                  TextField(
                    style: GoogleFonts.dmSans(fontSize: 12),
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(
                            12.0), // Adjust padding as needed
                        child: Image.asset(
                          'assets/icons/email_icon.png',
                          width: 24, // Adjust size as needed
                          height: 24,
                          color: Colors.white, 
                        ),
                      ),
                      hintText: 'EMAIL',
                      hintStyle: GoogleFonts.dmSans(
                        color: Colors.white, 
                        fontSize: 12,
                      ),
                      filled: true,
                      fillColor:
                          const Color(0xFFD1B48C), // TextField background color
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color(0xFFF9D4B4),
                          width: 1.5,
                        ), // Stroke color
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color(0xFFF9D4B4),
                          width: 1.5,
                        ), // Stroke color
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // PASSWORD TextField
                  TextField(
                    obscureText: true,
                    style: GoogleFonts.dmSans(fontSize: 12),
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(
                            12.0), // Adjust padding as needed
                        child: Image.asset(
                          'assets/icons/password_icon.png',
                          width: 24, // Adjust size as needed
                          height: 24,
                          color: Colors.white, 
                        ),
                      ),
                      hintText: 'PASSWORD',
                      hintStyle: GoogleFonts.dmSans(
                        color: Colors.white, 
                        fontSize: 12,
                      ),
                      filled: true,
                      fillColor:
                          const Color(0xFFD1B48C), // TextField background color
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color(0xFFF9D4B4),
                          width: 1.5,
                        ), // Stroke color
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color(0xFFF9D4B4),
                          width: 1.5,
                        ), // Stroke color
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // START MONEY TextField
                  TextField(
                    style: GoogleFonts.dmSans(fontSize: 12),
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(
                            12.0), // Adjust padding as needed
                        child: Image.asset(
                          'assets/icons/money_icon.png',
                          width: 24, // Adjust size as needed
                          height: 24,
                          color: Colors.white, 
                        ),
                      ),
                      hintText: 'START MONEY',
                      hintStyle: GoogleFonts.dmSans(
                        color: Colors.white, 
                        fontSize: 12,
                      ),
                      filled: true,
                      fillColor: const Color(0xFFD1B48C),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color(0xFFF9D4B4),
                          width: 1.5,
                        ), // Stroke color
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Color(0xFFF9D4B4),
                          width: 1.5,
                        ), // Stroke color
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // SIGN UP Button
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: const Color(0xFF546E7A),
                    width: 2), // Stroke border color and width
                borderRadius: BorderRadius.circular(30),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(250, 50),
                  backgroundColor: const Color(0xFF171B21),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0, // Remove shadow
                ),
                onPressed: () {
                  // Navigate to the Login page when "Sign Up" is pressed
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                child: Text(
                  'สมัครสมาชิก',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}