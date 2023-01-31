import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/data/core/api_constants.dart';

class ApiClient {
  final http.Client client;

  ApiClient({required this.client});

  dynamic get({required String path}) async {
    final url = '${ApiConstants.baseUrl}$path?api_key=${ApiConstants.apiKey}';
    final response = await client
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception();
    }
  }
}
