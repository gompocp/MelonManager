import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:melonmanager/api/apiutils.dart';
import 'package:melonmanager/models/vrchatmod.dart';
import 'package:melonmanager/themes.dart';

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //TODO: Switch to markdown without breaking everything lol
            SizedBox(
              width: min(MediaQuery.of(context).size.width/1.2, 800),
              child: Table(
                border: TableBorder.all(
                color: Colors.grey[300]
                ),
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: currentTheme.currentTheme == ThemeMode.dark ? Colors.grey[700] : Colors.grey[200],
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Latest Version: '),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(mod.versions.first.modversion),
                      ),
                    ]
                  ),
                  TableRow(
                    decoration: BoxDecoration(
                      color: currentTheme.currentTheme == ThemeMode.dark ? Colors.grey[600] : Colors.grey[100],
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('VRChat Version: '),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(mod.versions.first.vrchatversion),
                      ),
                    ]
                  ),
                  TableRow(
                      decoration: BoxDecoration(
                          color: currentTheme.currentTheme == ThemeMode.dark ? Colors.grey[700] : Colors.grey[200],
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('MelonLoader Version: '),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(mod.versions.first.loaderversion),
                        ),
                      ]
                  ),
                  TableRow(
                      decoration: BoxDecoration(
                          color: currentTheme.currentTheme == ThemeMode.dark ? Colors.grey[600] : Colors.grey[100]
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Mod Type: '),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(mod.versions.first.modtype),
                        ),
                      ]
                  ),
                ],
              ),
            ),
            /*FittedBox( // I dont know why but this fucking markdown widget breaks on mods with long descriptions and I give up so if you see this and can get it to work please tell me
                         // so that I dont have to suffer any longer
              fit: BoxFit.contain,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                child: MarkdownBody(
                  shrinkWrap: false,
                  fitContent: true,
                  data: mod.versions[0].description,
                ),
              ),
            ),*/
            Container(
              width: min(MediaQuery.of(context).size.width/1.2, 800),
              margin: EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: currentTheme.currentTheme == ThemeMode.dark ? Colors.grey[700] : Colors.grey[200],
                border: Border.all(
                    color: Colors.grey[300]
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  mod.versions.first.description,
                  style: TextStyle(
                      fontSize: 15
                  ),
                ),
              ),
            ),
            FittedBox(
              fit: BoxFit.contain,
              child: Padding(
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
            ),
          ],
        )
    );
  }
}
