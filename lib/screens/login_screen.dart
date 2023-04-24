// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/screens/signup_screen.dart';
import 'package:flutter_application_1/screens/splash/signUp_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                controller: emailController,
                decoration: InputDecoration(
                    icon: Icon(CupertinoIcons.mail),
                    hintText: 'Email',
                    hintStyle: regularStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                validator: (value) {
                  if (value!.isEmpty) {
                    return ('Enter Email');
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                    icon: Icon(CupertinoIcons.lock_shield_fill),
                    hintText: 'Password',
                    hintStyle: regularStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Password';
                  } else {
                    return null;
                  }
                },
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
                onPressed: () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString('email', emailController.text.toString());
                  sp.setBool('isLogin', true);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
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
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpSplash(),
                          ));
                    },
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
