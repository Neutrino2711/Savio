import 'package:exp_man/providers/student.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum Category { food, travel, work, leisure }

class AddExpenseScreen extends StatefulWidget {
  AddExpenseScreen({super.key, required this.onNewExpenseSave});

  void Function()? onNewExpenseSave;

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Category _selectedCategory = Category.leisure;

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 48, 16, keyboardSpace),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                  DropdownButton(
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
                  const Spacer(),
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
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () async {
                      bool added = await Provider.of<Student>(context,
                              listen: false)
                          .addTransaction(
                              title: _titleController.text,
                              amount: double.tryParse(_amountController.text),
                              category: _selectedCategory.index + 1);
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
                        widget.onNewExpenseSave!();
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
    );
  }
}
