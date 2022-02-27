import 'package:auth_project/authservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('register'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "email"),
              )),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: "password"),
              )),
          ElevatedButton(
              onPressed: () async {
                await _authService.createUserWithEmailAndPassword(emailController.text.trim(), passwordController.text.trim());
              },
              child: const Text('login')),

          // ElevatedButton(
          //     onPressed: () {
          //       Navigator.pushNamed(context, '/register');
          //     },
          //     child: const Text('register')),
        ],
      ),
    );
  }
}
