import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:melonmanager/api/btd6.dart';
import 'package:melonmanager/models/btd6mod.dart';


class BTD6ModInfo extends StatelessWidget {

  //TODO: Just pass in the mod forehead
  const BTD6ModInfo({
    Key key,
    @required this.btd6Mods,
    @required this.index
  }) : super(key: key);

  final List<BTD6Mod> btd6Mods;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        scrollable: true,
        title: Text(
            btd6Mods[index].name
        ),
        content: Column(
          children: [
            /*Markdown(
            data: mods[index].versions[0].description,
          ),*/
            Text(
              btd6Mods[index].description,
              style: TextStyle(
                  fontSize: 15
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Made by: ${btd6Mods[index].author}",),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: CircleAvatar(
                      minRadius: 10,
                      maxRadius: 15,
                      foregroundImage: CachedNetworkImageProvider("https://github.com/${BTD6.getGithubUsername(btd6Mods[index].downloadUrl)}.png?size=40",),
                      backgroundColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ],
        )
    );
  }
}
