import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/widgets/drawer.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text('Playlist'),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {},
              title: Text('Song'),
            );
          },
        ),
      ),
    );
  }
}
