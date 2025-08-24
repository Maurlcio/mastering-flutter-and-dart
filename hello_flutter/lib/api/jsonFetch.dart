import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchUsers() async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/users');

  final response = await http.get(
    url,
    headers: {
      //had to add a user-agent header to bypass a 403 status code that
      //kept returning from my GET requests in this directory specifically
      'User-Agent': 'Mozilla/5.0',
    },
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load users. Status code: ${response.statusCode}');
  }
}