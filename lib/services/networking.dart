import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper {
  final String url;
  NetworkHelper({required this.url});

  Future<dynamic> getData() async {
    Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
      throw Exception('Failed to get data');
    }
  }
}
