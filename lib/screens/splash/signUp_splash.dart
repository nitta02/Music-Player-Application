// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, unused_field, use_build_context_synchronously
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/roles/teacher_role.dart';
import 'package:flutter_application_1/roles/student_role.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpSplash extends StatefulWidget {
  const SignUpSplash({super.key});

  @override
  State<SignUpSplash> createState() => _SignUpSplashState();
}

class _SignUpSplashState extends State<SignUpSplash> {
  String _selectedRole = '';

  void signUpRole() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    if (_selectedRole == 'Teacher') {
      sp.setString('selectedRole', 'Teacher');
      Timer(const Duration(seconds: 5), () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TeacherRoleScreen(),
            ));
      });
    } else if (_selectedRole == 'Student') {
      sp.setString('selectedRole', 'Student');
      Timer(const Duration(seconds: 5), () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const StudentRoleScreen(),
            ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.png'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Select Your Role :',
                style: boldStyle,
              ),
              const SizedBox(
                width: 10,
              ),
              PopupMenuButton(
                splashRadius: 15.0,
                itemBuilder: (context) => [
                  PopupMenuItem(
                      onTap: () {
                        setState(() {
                          _selectedRole = 'Teacher';
                          signUpRole();
                        });
                      },
                      child: Row(
                        children: [
                          const Text(
                            'Teacher',
                            style: regularStyle,
                          ),
                          15.widthBox,
                          const Icon(FontAwesomeIcons.school)
                        ],
                      )),
                  PopupMenuItem(
                      onTap: () {
                        setState(() {
                          _selectedRole = 'Student';
                          signUpRole();
                        });
                      },
                      child: Row(
                        children: [
                          const Text(
                            'Student',
                            style: regularStyle,
                          ),
                          15.widthBox,
                          const Icon(FontAwesomeIcons.userAstronaut)
                        ],
                      )),
                ],
                child: Icon(_selectedRole == 'Teacher'
                    ? FontAwesomeIcons.school
                    : _selectedRole == 'Student'
                        ? FontAwesomeIcons.userAstronaut
                        : CupertinoIcons.person_alt_circle_fill),
              )
            ],
          ),
        ],
      ),
    );
  }
}
