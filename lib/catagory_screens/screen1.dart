// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'package:readmore/readmore.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Screen - 1',
          style: boldStyle,
        ),
        centerTitle: true,
      ),
      body: ReadMoreText(
        trimLines: 5,
        trimCollapsedText: 'Show More..',
        trimMode: TrimMode.Length,
        trimExpandedText: 'Show Less',
        lessStyle: boldStyle,
        moreStyle: boldStyle,
        'What is Lorem Ipsum?\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
        style: regularStyle,
      ),
    );
  }
}
