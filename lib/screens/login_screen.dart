// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/lottery/lottery_screen.dart';
import 'package:flutter_application_1/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  // Define the font family

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 100,
                    width: 100,
                  ),
                  Text(
                    'Triky_Medium',
                    style: regularStyle,
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 260.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Forget Password ?',
                    style: lightStyle,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            HomeScreen(), //Push to HomeScreen Page
                      ));
                },
                minWidth: 370,
                color: Colors.red,
                textColor: Colors.white,
                child: Text(
                  'Login',
                  style: boldStyle,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Do not have an Account ?',
                    style: lightStyle,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Sign UP',
                      style: boldStyle,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
