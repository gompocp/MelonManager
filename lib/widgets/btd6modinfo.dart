import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:melonmanager/api/apiutils.dart';
import 'package:melonmanager/api/btd6.dart';
import 'package:melonmanager/models/btd6mod.dart';


class BTD6ModInfo extends StatelessWidget {

  //TODO: Just pass in the mod forehead
  const BTD6ModInfo({
    Key key,
    @required this.mod,
  }) : super(key: key);

  final BTD6Mod mod;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        scrollable: true,
        title: Text(
            mod.name
        ),
        content: Column(
          children: [
            /*Markdown(
            data: mods[index].versions[0].description,
          ),*/
            Text(
              mod.description,
              style: TextStyle(
                  fontSize: 15
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Made by: ${mod.author}",),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: CircleAvatar(
                      minRadius: 10,
                      maxRadius: 15,
                      foregroundImage: CachedNetworkImageProvider(APIUtils.GetGithubProfilePictureUrl(mod.downloadUrl),),
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
