// ignore_for_file: avoid_print, prefer_const_literals_to_create_immutables
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/text_style_constant.dart';
import 'dart:math';

class LotteryScreenPage extends StatefulWidget {
  const LotteryScreenPage({super.key});

  @override
  State<LotteryScreenPage> createState() => _LotteryScreenPageState();
}

class _LotteryScreenPageState extends State<LotteryScreenPage> {
  int x = 0;
  int winningNumber = 15;
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'Lottery Screen',
          style: boldStyle,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Winning Number has to be $winningNumber',
              style: boldStyle,
            ),
            if (x == winningNumber)
              Container(
                height: 200,
                width: 250,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 244, 244, 244),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        CupertinoIcons.arrow_right,
                        size: 50,
                        color: Colors.green,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'You Won ',
                        style: boldStyle,
                      ),
                    ],
                  ),
                ),
              )
            else
              Container(
                height: 200,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        CupertinoIcons.exclamationmark_square,
                        size: 50,
                        color: Colors.red,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Your Number is :\n           $x',
                        style: boldStyle,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          x = random.nextInt(20);
          setState(() {});
        },
        backgroundColor: x == winningNumber ? Colors.green : Colors.indigo,
        child: x == winningNumber
            ? const Icon(Icons.done_all_sharp)
            : const Icon(CupertinoIcons.refresh_circled),
      ),
    );
  }
}
