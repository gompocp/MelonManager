import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  static bool seenWelcomeMessage = false;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final snackBar = SnackBar(
    action: SnackBarAction(
      textColor: Colors.blueAccent,
      label: 'Dismiss',
      onPressed: () {},
    ),
    backgroundColor: Colors.grey[800],
    content: Text(
      'Hello!',
      style: TextStyle(
        color: Colors.white
      ),
    )
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Builder(
          builder: (build) {
            if(!Home.seenWelcomeMessage) {
              Future.delayed(const Duration(milliseconds: 500), () {
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              });
              Home.seenWelcomeMessage = true;
            }
            return Text('Home Screen');
          },
        ),
      ),
    );
  }
}
