import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        title: Text(
            mod.versions[0].name
        ),
        content: Column(
          children: [
            //TODO: Switch to markdown without breaking everything lol
            /*Markdown(
            data: mods[index].versions[0].description,
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
