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
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF50559a).withOpacity(0.7),
                Color(0xFFd988a1).withOpacity(0.7),

                //50559a
              ]),
          boxShadow: const [
            BoxShadow(
              blurRadius: 1,
              offset: Offset(0, 1),
              // color: Color.fromARGB(255, 194, 194, 194),
            ),
          ],
        ),
        child: Center(
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.credit_score,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
