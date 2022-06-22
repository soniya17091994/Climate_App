import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(Climate());
}

class Climate extends StatelessWidget {
  const Climate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
