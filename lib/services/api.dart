import 'dart:convert';

import 'package:http/http.dart';
import '../services/networking.dart';

class APIModel {
  Future<dynamic> checkEmail(String email) async {
    Response response = await NetworkHelper().postData(
      url: "login/",
      jsonMap: {"email": email},
    );
    return jsonDecode(response.body);
  }

  Future<Response> createUser(String name, String email, String city) async {
    Response response = await NetworkHelper().postData(
      url: "createStudent/",
      jsonMap: {"name": name, "email": email, "city": city},
    );
    return response;
  }

  Future<Response> addTransaction(
      String title, double amount, int category, int studentID) async {
    Response response = await NetworkHelper().postData(
      url: "addTransaction/",
      jsonMap: {
        "title": title,
        "amount": amount,
        "category": category,
        "student": studentID
      },
    );
    return response;
  }
}
