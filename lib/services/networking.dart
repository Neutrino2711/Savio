import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper {
  static String baseUrl =
      'https://fd17-2401-4900-1c3c-345b-9182-801f-bc52-10aa.ngrok-free.app/api/'; //'http://YadoBoi.pythonanywhere.com/api/'

  Future<Response> getData(String url) async {
    Response response = await get(Uri.parse('$baseUrl$url'));
    return response;
  }

  Future<Response> postData(
      {required String url, required Map<String, dynamic> jsonMap}) async {
    String jsonString = json.encode(jsonMap);
    final response = await post(
      Uri.parse(baseUrl + url),
      body: jsonString,
      headers: {'Content-Type': 'application/json', 'Vary': 'Accept'},
    );
    return response;
  }

  Future<Response> putData(
      {required String url, required Map<String, dynamic> jsonMap}) async {
    String jsonString = json.encode(jsonMap);
    final response = await put(
      Uri.parse(baseUrl + url),
      body: jsonString,
      headers: {'Content-Type': 'application/json', 'Vary': 'Accept'},
    );
    return response;
  }

  Future<Response> patchData(
      {required String url, required Map<String, dynamic> jsonMap}) async {
    String jsonString = json.encode(jsonMap);
    final response = await patch(
      Uri.parse(baseUrl + url),
      body: jsonString,
      headers: {'Content-Type': 'application/json', 'Vary': 'Accept'},
    );
    return response;
  }

  Future<Response> deleteTransaction(int value) async {
    Response response =
        await delete(Uri.parse('${baseUrl}transaction/delete/$value'));
    return response;
  }
}
