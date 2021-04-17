import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:melonmanager/api/tld.dart';
import 'package:melonmanager/models/tldmod.dart';


class TLDModInfo extends StatelessWidget {

  //TODO: Just pass in the mod forehead
  const TLDModInfo({
    Key key,
    @required this.tldMods,
    @required this.index
  }) : super(key: key);

  final List<TLDMod> tldMods;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        scrollable: true,
        title: Text(
            tldMods[index].name
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
                  Text("Made by: ${tldMods[index].author}",),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: CircleAvatar(
                      minRadius: 10,
                      maxRadius: 15,
                      foregroundImage: CachedNetworkImageProvider("https://github.com/${TLD.getGithubUsername(tldMods[index].download.browserDownloadUrl)}.png?size=40",),
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
