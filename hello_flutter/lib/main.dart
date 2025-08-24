import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'recyclable profile card',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("List of Profiles"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ProfileCard(
            name: "Random Guy 1",
            description: "placeholder description for a random guy 1",
            imageUrl: "assets/images/im-not-paying-for-this-dawg.jpg",
          ),
          SizedBox(height: 20),
          ProfileCard(
            name: "Random Guy 2",
            description: "a supposedly different description for random guy 2",
            imageUrl: "assets/images/im-not-paying-for-this-dawg.jpg",
          ),
          SizedBox(height: 20),
          ProfileCard(
            name: "Random Guy 3",
            description:
                "yet another purpotedly different description for guy 3",
            imageUrl: "assets/images/im-not-paying-for-this-dawg.jpg",
          ),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final String description;
  final String imageUrl;

  const ProfileCard({
    super.key,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 320,
        ),
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(31, 0, 0, 0),
                blurRadius: 5,
                spreadRadius: 6,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(imageUrl),
              ),
              const SizedBox(height: 16),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
