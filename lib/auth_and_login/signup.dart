import 'dart:convert';
import 'package:exp_man/services/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'login.dart';
import '../utilities/custom_textfield.dart';
import '../utilities/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:exp_man/providers/student.dart';
import 'package:provider/provider.dart';
import 'package:exp_man/screens/home_screen.dart';

class RegisterPage extends StatelessWidget {
  static const routeName = '/register';
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  String? name, email, pass, city;

  RegisterPage({super.key});

  APIModel apiModel = APIModel();

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    debugPrint(user?.email);
    var dimensions = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Text('Create new account',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(
                height: 10,
              ),
              const Text('Please fill in the form to continue'),
              const SizedBox(height: 70),
              CustomTextField(
                label: 'Full Name',
                iconData: Icons.person,
                textEditingController: nameController,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                label: 'Email',
                iconData: Icons.email,
                textEditingController: emailController,
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                label: 'City',
                iconData: Icons.location_history,
                textEditingController: cityController,
                hint: 'Optional, can add later too..',
              ),
              const SizedBox(
                height: 70,
              ),
              CustomButton(
                  dimensions: dimensions,
                  label: 'Sign Up',
                  action: () async {
                    Response newUserData = await apiModel.createUser(
                        nameController.text,
                        emailController.text,
                        cityController.text);
                    if (newUserData.statusCode >= 200) {
                      dynamic newUserDetail = jsonDecode(newUserData.body);
                      Student student =
                          Provider.of<Student>(context, listen: false);
                      student.update(
                          id: newUserDetail['id'],
                          email: newUserDetail['email'],
                          name: newUserDetail['name'],
                          city: newUserDetail['city'],
                          transactions: newUserDetail['transactions'],
                          budgets: newUserDetail['budgets'],
                          credit_score: newUserDetail['credit_score']);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const HomeScreen())));
                    } else {
                      //use snackbar to tell that email entered already exists
                    }
                  }),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Have an Account? ",
                    style: TextStyle(),
                  ),
                  TextButton(
                    onPressed: () async {
                      Navigator.pushReplacementNamed(
                          context, LoginPage.routename);
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.titleMedium!.fontSize,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
