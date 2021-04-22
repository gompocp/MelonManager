import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:melonmanager/windowsapp.dart';

import 'defaultapp.dart';

void main() {
  if(kIsWeb || !Platform.isWindows) {
    runApp(DefaultApp());
  }
  else {
    runApp(WindowsApp());
    doWhenWindowReady(() {
      final win = appWindow;
      final initialSize = Size(1000, 600);
      final minSize = Size(450, 50);
      win.minSize = minSize;
      win.size = initialSize;
      win.alignment = Alignment.center;
      win.title = "MelonManager";
      win.show();
    });
  }
}
