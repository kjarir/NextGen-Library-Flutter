import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MaterialApp(
    home: Register(),
  ));
}

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bg = const Color(0xFFE5E4E2);

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: bg,
        body: Stack(
          children: [
            // Background Container with Linear Gradient
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [Color(0xFFFF0080), Color(0xFF7928CA)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Text(
                  'Welcome!',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // Glassmorphism Container for Register Page
            Container(
              height: MediaQuery.of(context).size.height * 1,
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.2,
                left: 20,
                right: 20,
                bottom: 30,
              ),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.100),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Buttons with only icons and no text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Add functionality for button tap
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.white.withOpacity(0.1)),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: const Icon(
                          Icons.facebook,
                          color: Colors.blue,
                          size: 30,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Add functionality for button tap
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.white.withOpacity(0.1)),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: const Icon(
                          Icons.apple,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Add functionality for button tap
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.white.withOpacity(0.1)),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: const Icon(
                          Icons.phone,
                          color: Colors.green,
                          size: 30,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),
                  // Text ' or '
                  const Center(
                    child: Text(
                      'or',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 30),

                  Text(
                    'Name',
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter your full name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                    ),
                    style: GoogleFonts.poppins(color: Colors.black),
                  ),

                  SizedBox(height: 30),
                  // Input boxes for name and email
                  Text(
                    'Email',
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter your email address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                    ),
                    style: GoogleFonts.poppins(color: Colors.black),
                  ),
                  const SizedBox(height: 25),

                  Text(
                    'Password',
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Enter a password',
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: GoogleFonts.poppins(color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  // "Forgot Password" Text
                  InkWell(
                    onTap: () {
                      // Handle the tap, navigate to another page
                      // You can use Navigator.push to navigate to the new page
                    },
                    child: Text(
                      'Get OTP',
                      style:
                          GoogleFonts.poppins(fontSize: 12, color: Colors.blue),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Button with a specified width
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Colors.transparent,
                      onPrimary: Colors.black, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.zero, // Remove default padding
                    ).copyWith(
                      fixedSize: MaterialStateProperty.all(
                          Size(300, 40)), // Set width and height
                    ),
                    onPressed: () {
                      // Add functionality for the button
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFF0080), Color(0xFF7928CA)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 116),
                        child: Text(
                          'Register',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  InkWell(
                      onTap: () {
                        // Handle the tap, navigate to another page
                        // You can use Navigator.push to navigate to the new page
                      },
                      child: Center(
                        child: Text(
                          'Already a user? Login',
                          style: GoogleFonts.poppins(
                              fontSize: 12, color: Colors.blue),
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
