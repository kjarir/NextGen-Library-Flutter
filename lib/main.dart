import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    const StartPage(),
  );
}

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Welcome to NextGen',
                style: GoogleFonts.montserrat(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                // Handle the second button tap
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Set your desired background color
                onPrimary: Colors.white, // Set text color
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Set button border radius
                ),
                fixedSize: Size(350, 50),
              ),
              child: Text(
                'Login',
                style: GoogleFonts.montserrat(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                // Handle the second button tap
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Set your desired background color
                onPrimary: Colors.white, // Set text color
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Set button border radius
                ),
                fixedSize: const Size(350, 50),
              ),
              child: Text(
                'Register',
                style: GoogleFonts.kronaOne(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
