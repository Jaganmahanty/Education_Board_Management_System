import 'package:flutter/material.dart';
import 'package:flutter_application/sign_up.dart';

// ignore: camel_case_types
class home_Page extends StatefulWidget {
  const home_Page({super.key});

  @override
  State<home_Page> createState() => _home_PageState();
}

// ignore: camel_case_types
class _home_PageState extends State<home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent.shade100,
        title: const Text(
          'Home Page',
          style: TextStyle(color: Colors.black),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text("Jagan Mahanty"),
              accountEmail: Text("jaganmahanty@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Student Sign Page'),
              onTap: () {
                // Navigate to home or perform action
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const sign_up()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Current Task'),
              onTap: () {
                // Navigate to settings or perform action
              },
            ),
          ],
        ),
      ),
    );
  }
}
