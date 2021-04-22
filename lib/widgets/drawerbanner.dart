import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DrawerBanner extends StatelessWidget {
  const DrawerBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: Image.asset('assets/images/DrawerBanner.jpg').image
          )
      ),
    );
  }
}
