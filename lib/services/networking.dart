import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper {
  static String baseUrl =
      'https://c398-2401-4900-1f3d-d838-ab0e-bae2-a5f4-c469.ngrok-free.app/api/';

  Future<Response> getData(String? email) async {
    Response response = await get(Uri.parse('${baseUrl}login/$email'));
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
}
