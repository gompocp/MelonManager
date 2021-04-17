import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:melonmanager/api/vrchat.dart';
import 'package:melonmanager/models/vrchatmod.dart';

class VRChatModInfo extends StatelessWidget {

  const VRChatModInfo({
    Key key,
    @required this.vrcMods,
    @required this.index
  }) : super(key: key);

  final List<VRChatMod> vrcMods;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        scrollable: true,
        title: Text(
            vrcMods[index].versions[0].name
        ),
        content: Column(
          children: [
            /*Markdown(
            data: mods[index].versions[0].description,
          ),*/
            Text(
              vrcMods[index].versions[0].description,
              style: TextStyle(
                  fontSize: 15
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Made by: ${vrcMods[index].versions[0].author.startsWith("<@!") ? VRChat.getGithubUsername(vrcMods[index].versions[0].sourcelink) : vrcMods[index].versions[0].author}",),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: CircleAvatar(
                      minRadius: 10,
                      maxRadius: 15,
                      foregroundImage: CachedNetworkImageProvider("https://github.com/${VRChat.getGithubUsername(vrcMods[index].versions[0].sourcelink)}.png?size=40",),
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
