import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:melonmanager/screens/btd6mods.dart';
import 'package:melonmanager/screens/home.dart';
import 'package:melonmanager/screens/tldmods.dart';
import 'package:melonmanager/screens/vrchatmods.dart';

import 'drawerbanner.dart';

class NavDrawer extends StatelessWidget with ChangeNotifier {
  static Widget currentScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerBanner(),
          ListTile(
            title: Text('Home'),
            onTap: ()  {
              Navigator.pop(context);
              currentScreen = Home();
              notifyListeners();
            },
          ),
          ListTile(
            title: Text('VRChat'),
            onTap: ()  {
              Navigator.pop(context);
              currentScreen = VRChatMods();
              notifyListeners();
            },
          ),
          ListTile(
            title: Text('BloonsTD6'),
            onTap: () {
              Navigator.pop(context);
              currentScreen = BTD6Mods();
              notifyListeners();
            },
          ),
          ListTile(
            title: Text('The Long Dark'),
            onTap: () {
              Navigator.pop(context);
              currentScreen = TLDMods();
              notifyListeners();
            },
          ),
        ],
      ),
    );
  }
}
