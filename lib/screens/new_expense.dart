import 'package:exp_man/providers/student.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum Category { food, travel, work, leisure }

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Category _selectedCategory = Category.leisure;

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 48, 16, keyboardSpace + 16),
              child: Column(
                children: [
                  TextField(
                    maxLength: 50,
                    controller: _titleController,
                    decoration: const InputDecoration(
                      label: Text('Title'),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: _amountController,
                          decoration: const InputDecoration(
                            prefix: Text('\$'),
                            label: Text('Amount'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: DropdownButton(
                          value: _selectedCategory,
                          items: Category.values
                              .map(
                                (category) => DropdownMenuItem(
                                  value: category,
                                  child: Text(
                                    category.name.toUpperCase(),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedCategory = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          bool added = await Provider.of<Student>(context,
                                  listen: false)
                              .addTransaction(
                                  title: _titleController.text,
                                  amount:
                                      double.tryParse(_amountController.text),
                                  category: _selectedCategory.index);
                          if (!added) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Invalid Input'),
                                content: const Text(
                                    "Make sure a valid title, amount and category was entered."),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Okay'),
                                  )
                                ],
                              ),
                            );
                          } else {
                            Navigator.pop(context);
                          }
                        },
                        child: const Text('Save Expenses'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
