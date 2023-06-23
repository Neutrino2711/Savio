import 'package:exp_man/utilities/profile_stack_design.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final _titleController = TextEditingController();
  final _emailController = TextEditingController();
  final _cityController = TextEditingController();
  final _totalBudgetController = TextEditingController();
  final _categoryBudgetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const ProfileStackDesign(),
          const Text('Profile Tab'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    label: Text('Title'),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    label: Text('Email'),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _cityController,
                  decoration: const InputDecoration(
                    label: Text('City'),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _totalBudgetController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          label: Text('Total Budget'),
                          prefixText: '\$ ',
                        ),
                      ),
                    ),
                    const Spacer(),
                    // const SizedBox(
                    //   width: 40,
                    // ),
                    ElevatedButton(
                        onPressed: () {}, child: const Text('Save Edit')),
                    // Expanded(
                    //   child: TextField(
                    //     controller: _categoryBudgetController,
                    //     keyboardType: TextInputType.number,
                    //     decoration: const InputDecoration(
                    //       label: Text('Category Budget'),
                    //       prefixText: '\$ ',
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                // const SizedBox(height: 32),
                // ElevatedButton(
                //     onPressed: () {}, child: const Text('Save Edit')),
              ],
            ),
          ),
          // Container(
          //   height: 1000,
          //   color: const Color(0xFFfafafa),
          // ),
        ],
      ),
    );
  }
}
