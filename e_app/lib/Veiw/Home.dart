import 'package:e_app/const/color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorblue,
        title: const Text(
          "e-Shop",
          style: TextStyle(
              color: colorwhite,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        color: colorwhite,
        height: size.height * 1,
        width: size.width * 1,

      ),
    );
  }
}
