import 'package:finanzasfb/widgets/auth_header_background.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthHeaderBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 250),
              Text('Login', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
