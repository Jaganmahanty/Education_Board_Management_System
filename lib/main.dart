//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDwGEKCltHUyHXw15JdXWs414_c6qJ1ev8",
          appId: "1:65318594453:android:e72fc6f3a51106cb61389c",
          messagingSenderId: "65318594453",
          projectId: "flutter-application-92761"));
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.deepPurpleAccent,
            scrollbarTheme: ScrollbarThemeData(
              thumbColor:
                  WidgetStateProperty.all(Colors.deepPurpleAccent.shade200),
            )),
        home: const home_Page());
  }
}
