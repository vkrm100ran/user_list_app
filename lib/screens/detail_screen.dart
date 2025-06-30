import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserDetailScreen extends StatelessWidget {
  final User user;

  const UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Username'),
              subtitle: Text(user.name),
            ),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Email'),
              subtitle: Text(user.email),
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Phone'),
              subtitle: Text(user.phone),
            ),
            const SizedBox(height: 16),
            const Text("Address",
                style: TextStyle(fontWeight: FontWeight.bold)),
            ListTile(
              title: Text("${user.address.street}, ${user.address.suite}"),
              subtitle: Text("${user.address.city}, ${user.address.zipcode}"),
            ),
            const SizedBox(height: 16),
            const Text("Company",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
