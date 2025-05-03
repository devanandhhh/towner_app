
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Towner_app'),),
    );
  }
}

reverseString(String word) {
  return word.split("").reversed.join();
}
