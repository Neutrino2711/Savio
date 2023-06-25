import 'package:exp_man/widgets/custom_appbar.dart';
import 'package:exp_man/widgets/user_detail_tile.dart';
import 'package:flutter/material.dart';
import 'package:exp_man/providers/student.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    Student student = Provider.of<Student>(context);
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          CustomAppbar(
            title: title,
          ),
          const SizedBox(height: 16),
          UserdetailTile(
            Icons.chevron_right_outlined,
            titleDescription: student.name,
            trailingIcon: Icons.create,
            title: 'Name',
            onPress: () {},
          ),
          const Divider(
            thickness: 0.5,
            indent: 20,
            endIndent: 20,
          ),
          UserdetailTile(
            Icons.chevron_right_outlined,
            titleDescription: student.city,
            trailingIcon: Icons.create,
            title: 'City',
            onPress: () {},
          ),
          const Divider(
            thickness: 0.5,
            indent: 20,
            endIndent: 20,
          ),
          UserdetailTile(
            Icons.chevron_right_outlined,
            titleDescription: '\$ 400',
            trailingIcon: Icons.create,
            title: 'Total budget',
            onPress: () {},
          ),
          const Divider(
            thickness: 0.5,
            indent: 20,
            endIndent: 20,
          ),
        ],
      )),
    );
  }
}
