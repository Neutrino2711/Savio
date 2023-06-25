// ignore_for_file: prefer_const_constructors

import 'package:exp_man/auth_and_login/google_signin.dart';
import 'package:exp_man/providers/student.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_and_login/signup.dart';
import 'auth_and_login/login.dart';
import 'auth_and_login/home_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: ((context) => GoogleSignInProvider())),
          ChangeNotifierProvider(create: ((context) => Student()))
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          // theme: ThemeData.dark().copyWith(
          //     textTheme: TextTheme(
          //       titleLarge: TextStyle(
          //           fontSize: 24,
          //           fontWeight: FontWeight.bold,
          //           color: Colors.white.withOpacity(0.9)),
          //       bodyMedium:
          //           const TextStyle(fontSize: 18, color: Colors.white70),
          //       bodySmall: const TextStyle(fontSize: 13, color: Colors.white70),
          //       titleMedium: const TextStyle(fontSize: 19),
          //       titleSmall: const TextStyle(fontSize: 15),
          //     ),
          //     chipTheme: ChipThemeData(
          //       backgroundColor: Colors.white.withOpacity(0.9),
          //       selectedColor: Colors.amber,
          //       disabledColor: Colors.white70,
          //     ),
          //     colorScheme: ColorScheme.fromSwatch().copyWith(
          //       secondary: Colors.white70,
          //       // primary: Colors.white70,
          //     ),
          //     scaffoldBackgroundColor: const Color.fromRGBO(24, 25, 32, 1),
          //     drawerTheme: const DrawerThemeData(
          //       backgroundColor: Color.fromRGBO(24, 25, 32, 1),
          //     )),
          // home: HomePage(),
          routes: {
            '/': (context) => LoginPage(),
            LoginPage.routename: (context) => LoginPage(),
            RegisterPage.routeName: (context) => RegisterPage(),
            Home.id: (context) => Home(),
          },
        ),
      );
}
