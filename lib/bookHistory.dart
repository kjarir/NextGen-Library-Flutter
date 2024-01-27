import 'package:flutter/material.dart';

class BookHisttory extends StatelessWidget {
  const BookHisttory({Key? key}) : super(key: key);

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
