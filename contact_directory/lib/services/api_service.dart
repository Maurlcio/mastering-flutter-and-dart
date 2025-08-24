import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:contact_directory/models/contact.dart';

Future<List<Contact>> fetchContacts() async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);

    return data.map((json) => Contact.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load contacts');
  }
}