import 'package:exp_man/google_signin.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login.dart';
// import 'package:movie_app/providers/loader.dart';
// import 'package:movie_app/providers/user.dart';

import 'custom_textfield.dart';
import 'custom_button.dart';
import 'custom_password.dart';
// import 'networking.dart';
import 'package:provider/provider.dart';

class LoggedIn extends StatelessWidget {
  const LoggedIn({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    var dimensions = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogout();
              },
              child: Text('Logout',
              style: TextStyle(
                color: Colors.white,
              ),),
            )
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Text('Profile', style: Theme.of(context).textTheme.titleLarge),
              SizedBox(
                height: 20.0,
              ),
              CircleAvatar(
                radius: 40.0,
                backgroundImage: NetworkImage(user!.photoURL.toString()),
              ),
              Text(
                'Name: ' + user.displayName.toString(),
              ),
              Text(
                'Email: ' + user.email.toString(),
              )
            ],
          )),
        ));
  }
}
