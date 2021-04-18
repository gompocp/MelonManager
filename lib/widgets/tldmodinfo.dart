import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:melonmanager/api/apiutils.dart';
import 'package:melonmanager/models/tldmod.dart';


class TLDModInfo extends StatelessWidget {


  const TLDModInfo({
    Key key,
    @required this.mod,
  }) : super(key: key);

  final TLDMod mod;

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
            /*Text(
              tldMods[index].de,
              style: TextStyle(
                  fontSize: 15
              ),
            ),*/
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
                      foregroundImage: CachedNetworkImageProvider(APIUtils.GetGithubProfilePictureUrl(mod.download.browserDownloadUrl),),
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
