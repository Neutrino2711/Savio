import 'package:flutter/cupertino.dart';

class Student with ChangeNotifier {
  int id = 0;
  String email = '';
  String name = '';
  List<dynamic> transactions = [];
  List<dynamic> budgets = [];
  double credit_score = 0.0;
  String city = '';

  void update({
    required int id,
    required String email,
    required String name,
    required String city,
    required List<dynamic> transactions,
    required List<dynamic> budgets,
    required double credit_score,
  }) {
    this.id = id;
    this.email = email;
    this.name = name;
    this.city = city;
    this.transactions = transactions;
    this.budgets = budgets;
    this.credit_score = credit_score;
  }
}
