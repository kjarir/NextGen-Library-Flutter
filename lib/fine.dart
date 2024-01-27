import 'package:flutter/material.dart';

class FinePage extends StatelessWidget {
  const FinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Page'),
      ),
      body: Center(
        child: Text('This is the Privacy Page'),
      ),
    );
  }
}
