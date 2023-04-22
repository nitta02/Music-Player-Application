import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/catagory_screen_constants.dart';
import 'package:flutter_application_1/constants/images_constant.dart';
import 'package:flutter_application_1/constants/personName_constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: camel_case_types
class Home_Body extends StatelessWidget {
  const Home_Body({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Card(
          elevation: 15.0,
          margin: const EdgeInsets.all(10.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(
                personsImages[index],
              ),
            ),
            title: Text(
              personNames[index],
            ),
            subtitle: const Text('Welcome to my profile'),
            trailing: const Icon(
              (FontAwesomeIcons.android),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => screenCatagory[index],
                  ));
            },
          ),
        );
      },
    );
  }
}
