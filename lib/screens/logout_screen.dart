import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogOutScreen extends StatefulWidget {
  const LogOutScreen({super.key});

  @override
  State<LogOutScreen> createState() => _LogOutScreenState();
}

class _LogOutScreenState extends State<LogOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Log_out',
          style: boldStyle,
        ),
        centerTitle: true,
      ),
      body: Align(
        child: MaterialButton(
            color: Colors.indigo,
            hoverColor: Colors.white,
            onPressed: () async {
              SharedPreferences sp = await SharedPreferences.getInstance();
              sp.clear();
              // ignore: use_build_context_synchronously
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
            },
            child: const Text(
              'Logout',
              style: regularStyle,
            )),
      ),
    );
  }
}
