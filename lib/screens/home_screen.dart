import 'package:flutter/material.dart';
import 'package:exp_man/constants.dart';
import 'package:exp_man/screens/new_expense.dart';
import 'package:exp_man/utilities/graph_generator.dart';
import 'package:exp_man/utilities/navigation_bar.dart';
import 'package:exp_man/providers/student.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void addExpenseBottomSheet(BuildContext context) {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (context) => const NewExpense());
  }

  @override
  Widget build(BuildContext context) {
    Student student = Provider.of<Student>(context);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 246, 239, 239),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back, color: kDefaultColor),
          ),
          title: const Text(
            'Savio',
            style: TextStyle(color: kDefaultColor, fontSize: 28),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.credit_score, color: kDefaultColor),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications, color: kDefaultColor),
            )
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 246, 239, 239),
        body: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width,
                      ),
                      Container(
                        width: double.infinity,
                        height: size.width * 0.68,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const GraphGenerator(),
                      ),
                      Text(
                        student.name,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 30),
                      ),
                      Text(student.transactions.length.toString()),
                    ],
                  ),
                ),
              ),
            ),
            MyCustomBottomNavigationBar(
              onAddPress: () {
                addExpenseBottomSheet(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
