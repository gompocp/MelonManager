import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class MelonHover extends StatefulWidget {
  const MelonHover({Key key}) : super(key: key);

  @override
  MelonHoverState createState() => MelonHoverState();
}

class MelonHoverState extends State<MelonHover> {

  Artboard _riveArtboard;
  RiveAnimationController _controller;
  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/animations/melonbounce.riv').then(
          (data) async {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        artboard.addController(_controller = SimpleAnimation('Hover'));
        setState(() => _riveArtboard = artboard);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: _riveArtboard == null
            ? const SizedBox()
            : Rive(
          fit: BoxFit.fitHeight,
          artboard: _riveArtboard,
        ),
      ),
    );
  }
}