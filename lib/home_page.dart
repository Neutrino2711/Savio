import 'package:flutter/material.dart';
import 'signup.dart';
import 'login.dart';

class home extends StatelessWidget {
  const home({super.key});

  static String id = 'home';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 70.0,
            width: 170.0,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  shape: StadiumBorder(), backgroundColor: Colors.blue),
              onPressed: () {
                Navigator.pushNamed(context, LoginPage.routename);
              },
              child: Text(
                'login',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 60.0,
          ),
          SizedBox(
            height: 70.0,
            width: 170.0,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: StadiumBorder(),
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                Navigator.pushNamed(context, RegisterPage.routeName);
              },
              child: Text('Register',
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ),
          ),
          
          SizedBox(
            height: 70.0,
            width: 170.0,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  shape: StadiumBorder(), backgroundColor: Colors.blue),
              onPressed: () {
                Navigator.pushNamed(context, LoginPage.routename);
              },
              child: Text(
                'SignIn Google',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
