import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileDataScreen extends StatefulWidget {
  const ProfileDataScreen({super.key});

  @override
  State<ProfileDataScreen> createState() => _ProfileDataScreenState();
}

class _ProfileDataScreenState extends State<ProfileDataScreen> {
  String email = '';
  String password = '';
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('email') ?? '';
    password = sp.getString('password') ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Profile Data',
          style: boldStyle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              elevation: 15.0,
              child: Row(
                children: [
                  const Text(
                    'Email: ',
                    style: boldStyle,
                  ),
                  Text(
                    email.toString(),
                    style: regularStyle,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Card(
              elevation: 15.0,
              child: Row(
                children: [
                  const Text('Password: ', style: boldStyle),
                  Text(
                    password.toString(),
                    style: regularStyle,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
