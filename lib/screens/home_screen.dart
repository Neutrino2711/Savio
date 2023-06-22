import 'package:exp_man/screens/user_profile.dart';
import 'package:exp_man/widgets/transaction_tile.dart';
import 'package:flutter/material.dart';
import 'package:exp_man/screens/new_expense.dart';
import 'package:exp_man/utilities/graph_generator.dart';
import 'package:exp_man/utilities/navigation_bar.dart';
import 'package:provider/provider.dart';
import 'package:exp_man/providers/student.dart';

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
    Student student = Provider.of<Student>(
        context); //listen ko false na dene se stl widget hote hue bhi build har baar run hoga jab jab provider value change hoga
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text(
            'Savio',
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.credit_score),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            )
          ],
        ),
        body: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width,
                      ),
                      // Text(student.name,
                      //     style: Theme.of(context).textTheme.headlineLarge),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 5, right: 5, bottom: 8, top: 8),
                        width: double.infinity,
                        height: size.width * 0.68,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 1,
                              offset: Offset(0, 1),
                              color: Color.fromARGB(255, 194, 194, 194),
                            ),
                          ],
                        ),
                        child: const GraphGenerator(),
                      ),
                      const TransactionTileBuilder(),
                    ],
                  ),
                ),
              ),
            ),
            MyCustomBottomNavigationBar(
              onAddPress: () {
                addExpenseBottomSheet(context);
              },
              onProfilePress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const UserProfile())));
              },
            ),
          ],
        ),
      ),
    );
  }
}
