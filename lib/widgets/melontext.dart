import 'package:flutter/cupertino.dart';
import 'package:melonmanager/constants.dart';

class MelonText extends StatelessWidget {
  final double fontSize;
  MelonText({this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('Melon',
          style: TextStyle(
              fontSize: fontSize,
              fontFamily: 'Jaapokki',
              color: melonGreenColor
          ),
        ),
        Expanded(
          child: Text('Manager',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: fontSize,
                fontFamily: 'Jaapokki',
                color: melonRedColor
            ),
          ),
        ),
      ],
    );
  }
}
