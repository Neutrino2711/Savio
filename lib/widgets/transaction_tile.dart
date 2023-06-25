import 'package:flutter/material.dart';
import 'package:exp_man/providers/student.dart';
import 'package:provider/provider.dart';

enum Category { food, travel, work, leisure }

class TransactionTileBuilder extends StatelessWidget {
  const TransactionTileBuilder({super.key});

  void newFunction(int value) {
    return;
  }

  @override
  Widget build(BuildContext context) {
    Student student = Provider.of<Student>(context);
    return ListView.builder(
      physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
      shrinkWrap: true,
      itemCount: student.transactions.length,
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      student.transactions[index]['title'],
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    PopupMenuButton(
                      padding: const EdgeInsets.all(0),
                      iconSize: 21,
                      itemBuilder: ((context) => [
                            const PopupMenuItem(
                              height: 30,
                              value: 0,
                              child: Text('Modify'),
                            ),
                            const PopupMenuItem(
                              height: 30,
                              value: 1,
                              child: Text('Delete'),
                            ),
                          ]),
                      onSelected: (value) {
                        if (value == 1) {
                          student.deleteTransaction(
                              student.transactions[index]['id']);
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text('\$${student.transactions[index]['amount']}'),
                    const Spacer(),
                    Text(
                        'category: ${student.transactions[index]['category']}'),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
