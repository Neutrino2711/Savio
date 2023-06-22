import 'dart:convert';

import 'package:exp_man/services/networking.dart';
import 'package:http/http.dart';
import 'package:flutter/cupertino.dart';

class Student with ChangeNotifier {
  int id = 0;
  String email = '';
  String name = '';
  List<dynamic> transactions = [];
  List<dynamic> budgets = [];
  double credit_score = 0.0;
  String city = '';

  void update({required dynamic data}) {
    id = data['id'];
    email = data['email'];
    name = data['name'];
    transactions = data['transactions'];
    budgets = data['budgets'];
    credit_score = double.tryParse(data['credit_score'] as String)!;
    city = data['city'];
  }

  Future<bool> addTransaction(
      {required String title,
      required double? amount,
      required int category}) async {
    if (title.isEmpty || amount == null || amount < 0) {
      return Future.value(false);
    }
    Response response = await NetworkHelper().postData(
        url: 'addTransaction/',
        jsonMap: {
          'title': title,
          'amount': amount,
          'category': category,
          'student': id
        });
    dynamic data = jsonDecode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      update(data: data);
      notifyListeners();
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }
}
