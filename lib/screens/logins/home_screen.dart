// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:flutter_application_1/widgets/home_body.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Home_Screen',
            style: boldStyle,
          ),
          centerTitle: true,
          actions: [
            Center(
              child: Badge(
                isLabelVisible: true,
                label: Text('2'),
                child: Icon(Icons.notifications),
              ),
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/person1.jpg'),
                  ),
                  margin: EdgeInsets.all(1.5),
                  accountName: const Text(
                    'Triky Learn',
                    style: boldStyle,
                  ),
                  accountEmail: const Text(
                    'trikylearn@gmail.com',
                    style: regularStyle,
                  )),
              ListTile(
                leading: Icon(CupertinoIcons.home),
                title: Text('Home'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.category_sharp),
                title: Text('Catagory Page'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {},
              ),
            ],
          ),
        ),

        //------------------------Body Part-------------
        body: Home_Body(),
      ),
    );
  }
}
