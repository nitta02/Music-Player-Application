import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/provider/themeProvider.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          ListTile(
            title: Text('Home'),
          ),
          Row(
            children: [
              Text('Theme'),
              CupertinoSwitch(
                value:
                    Provider.of<Themeprovider>(context, listen: false).isDark,
                onChanged: (value) {
                  Provider.of<Themeprovider>(context, listen: false).setTheme();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
