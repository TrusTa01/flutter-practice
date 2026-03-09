import 'package:flutter/material.dart';
import 'package:flutter_application_default/user_form/model/user.dart';

class UserInfoPage extends StatelessWidget {
  final User userInfo;

  const UserInfoPage({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Info'), centerTitle: true),
      body: Card(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Name: ${userInfo.name ?? "Not provided"}',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('Story: ${userInfo.story ?? "Not provided"}'),
              leading: Icon(Icons.person, color: Colors.black),
              trailing: Text('Country: ${userInfo.country ?? "Not provided"}'),
            ),
            ListTile(
              title: Text(
                'Phone: ${userInfo.phone ?? "Not provided"}',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              leading: Icon(Icons.phone, color: Colors.black),
            ),
            ListTile(
              title: Text(
                'Email: ${userInfo.email ?? "Not provided"}',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              leading: Icon(Icons.mail, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
