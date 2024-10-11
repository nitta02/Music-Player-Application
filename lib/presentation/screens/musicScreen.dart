// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/provider/songProvider.dart';
import 'package:flutter_application_1/core/provider/themeProvider.dart';
import 'package:flutter_application_1/presentation/widgets/boxShape.dart';
import 'package:provider/provider.dart';

class Musicscreen extends StatelessWidget {
  final String name;
  final String artistname;
  final String imagePath;
  const Musicscreen({
    super.key,
    required this.imagePath,
    required this.name,
    required this.artistname,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Text(
                    'Music Player',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Consumer<Songprovider>(
                builder: (context, value, child) => Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 15,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 350,
                        width: 300,
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Provider.of<Themeprovider>(context).isDark
                              ? Colors.grey.shade700
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(2, 2),
                                blurRadius: 1,
                                color:
                                    Provider.of<Themeprovider>(context).isDark
                                        ? Colors.grey.shade700
                                        : Colors.grey.shade500),
                            BoxShadow(
                                offset: const Offset(-2, -2),
                                blurRadius: 1,
                                color:
                                    Provider.of<Themeprovider>(context).isDark
                                        ? Colors.grey.shade700
                                        : Colors.grey.shade500),
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 5,
                                ),
                                height: 280,
                                width: 250,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Image.asset(imagePath)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      name,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      artistname,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                                const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('0:00'),
                                Icon(Icons.shuffle),
                                Icon(Icons.repeat),
                                Text('0:00'),
                              ],
                            ),
                            const SizedBox(height: 20),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                  thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 0,
                              )),
                              child: Slider(
                                value: 50,
                                min: 0,
                                max: 100,
                                onChanged: (value) {},
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Boxshape(
                                    child: const Center(
                                        child: Icon(Icons.skip_previous)),
                                    onTap: () {
                                      value.previousSong();
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Boxshape(
                                      child: Center(
                                        child: value.isPlaying &&
                                                value.currentSong ==
                                                    value.songList[0].audioPath
                                            ? const Icon(Icons.pause)
                                            : const Icon(Icons.play_arrow),
                                      ),
                                      onTap: () async {
                                        await value
                                            .play(value.songList[0].audioPath);
                                      },
                                    )),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Boxshape(
                                    child: const Center(
                                        child: Icon(Icons.skip_next)),
                                    onTap: () {
                                      value.nextSong();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
