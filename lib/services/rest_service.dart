import 'dart:convert';
import 'package:http/http.dart' as http;

class RestService {
  static const String baseUrl =
      'https://intechship-yem-default-rtdb.firebaseio.com/';

  Future get(String endpoint) async {
    final response = await http.get('$baseUrl/$endpoint');

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    print('error');
  }

  Future post(String endpoint, {dynamic data}) async {
    final response =
        await http.post('$baseUrl/$endpoint', body: jsonEncode(data));
    // print(response.statusCode);
    // print('body is ${response.body}');
    if (response.statusCode == 201 || response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return 'error';
  }
}
