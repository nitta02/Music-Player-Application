// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Screen_3',
          style: boldStyle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: InkWell(
          onTap: () async {
            SharedPreferences sp = await SharedPreferences.getInstance();
            sp.setString('Tapped', 'Yes');
            print('Tapped');
          },
          child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Center(
                  child: Text(
                'Click Here',
                style: regularStyle,
              ))),
        ),
      ),
    );
  }
}
