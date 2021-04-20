import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:melonmanager/api/apiutils.dart';
import 'package:melonmanager/models/vrchatmod.dart';

class VRChatModInfo extends StatelessWidget {

  const VRChatModInfo({
    Key key,
    @required this.mod,
  }) : super(key: key);

  final VRChatMod mod;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        scrollable: true,
        title: RichText(
          text: TextSpan(
            text: mod.versions.first.name+" ",
            style: TextStyle(
              fontSize: 25
            ),
            children: <TextSpan>[
              TextSpan(text: mod.versions.first.modversion, style: TextStyle(fontSize: 15)),
            ],
          ),
        ),
        /*Row(
          children: [
            Text(
                mod.versions[0].name
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                  mod.versions[0].modversion,
                  style: TextStyle(
                    textBaseline: TextBaseline.alphabetic,
                    fontSize: 15
                  ),
              ),
            ),
          ],
        ),*/
        content: Column(
          children: [
            //TODO: Switch to markdown without breaking everything lol
           /* FittedBox(
              fit: BoxFit.contain,
              child: Markdown(
                data: mod.versions[0].description,
              ),
            ),*/
            Text(
              mod.versions[0].description,
              style: TextStyle(
                  fontSize: 15
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Made by: ${mod.versions[0].author.startsWith("<@!") ? APIUtils.GetGithubUsername(mod.versions[0].sourcelink) : mod.versions[0].author}",),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: CircleAvatar(
                      minRadius: 10,
                      maxRadius: 15,
                      foregroundImage: CachedNetworkImageProvider(APIUtils.GetGithubProfilePictureUrl(mod.versions[0].sourcelink),),
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
