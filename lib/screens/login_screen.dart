// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/logo1.jpg',
                  height: 50,
                  width: 50,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                'Triky_Medium',
                style: TextStyle(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
