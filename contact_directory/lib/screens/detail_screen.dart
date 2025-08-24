import 'package:flutter/material.dart';
import 'package:contact_directory/models/contact.dart';

class DetailScreen extends StatelessWidget {
  final Contact contact;

  const DetailScreen({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contact.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoTile(label: 'Name', value: contact.name),
            const SizedBox(height: 8),
            InfoTile(label: 'Email', value: contact.email),
            const SizedBox(height: 8),
            InfoTile(label: 'Phone', value: contact.phone),
            const SizedBox(height: 8),
            InfoTile(label: 'Website', value: contact.website),
          ],
        ),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final String label;
  final String value;

  const InfoTile({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Text(value),
        ),
      ],
    );
  }
}
