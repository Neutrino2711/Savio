import 'package:flutter/material.dart';

class CircularIconCard extends StatelessWidget {
  const CircularIconCard({super.key});

  get copyWith => null;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(left: 5, right: 5, bottom: 8, top: 8),
        width: size.width * 0.15,
        height: size.width * 0.15,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          // color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              offset: Offset(0, 1),
              // color: Color.fromARGB(255, 194, 194, 194),
            ),
          ],
        ),
        child: const Center(child: Text('icon')),
      ),
    );
  }
}
