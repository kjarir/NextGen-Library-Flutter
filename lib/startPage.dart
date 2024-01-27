import 'package:flutter/material.dart';

void main() {
  runApp(const StartPage());
}

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr, // Set the text direction as needed
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Add functionality for the first button
                },
                child: Text('Login'),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Add functionality for the second button
                },
                child: Text('Register'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
