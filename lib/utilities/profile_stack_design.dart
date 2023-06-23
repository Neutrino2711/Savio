import 'package:flutter/material.dart';

class ProfileStackDesign extends StatelessWidget {
  const ProfileStackDesign({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        SizedBox(
          height: screenHeight * 0.297,
        ),
        Container(
          height: screenHeight * 0.2,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.vertical(
                bottom: Radius.elliptical(
                    MediaQuery.of(context).size.width, 250.0)),
          ),
        ),
        Positioned(
          top: screenHeight * 0.11,
          left: screenHeight * 0.162,
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFfafafa),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(color: Colors.black26, spreadRadius: 0, blurRadius: 8)
              ],
            ),
            child: const CircleAvatar(
              backgroundColor: Color(0xFFfafafa),
              radius: 60,
            ),
          ),
        ),
        Positioned(
          top: screenHeight * 0.11,
          left: screenHeight * 0.1648,
          child: Center(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person_sharp,
                size: 100,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
