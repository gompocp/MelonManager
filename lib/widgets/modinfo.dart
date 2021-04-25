import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:melonmanager/api/apiutils.dart';
import 'package:melonmanager/themes.dart';

class ModInfo extends StatelessWidget {
  final String name;
  final String version;
  final String author;
  final String githubLink; //Used to get author profile picture
  final String description;
  final String vrcVersion;
  final String mlVersion;
  final String modType;
  final String tags;
  final bool workingCurrently;
  final List<String> authors;
  final List<String> dependencies;
  int shadeOffset = 100;
  ModInfo({Key key, @required this.name, @required this.version, @required this.author, @required this.githubLink, @required this.description, @required this.vrcVersion, @required this.mlVersion, @required this.modType, @required this.tags, @required this.workingCurrently, @required this.authors, @required this.dependencies}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        scrollable: true,
        title: Text(name),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //TODO: Switch to markdown without breaking everything lol
            SizedBox(
              width: min(MediaQuery.of(context).size.width/1.2, 800),
              child: Table(
                border: TableBorder.all(color: Colors.grey[300]),
                children: [
                  buildTableRow("Latest Version: ", version),
                  buildTableRow("VRChat Version: ", vrcVersion),
                  buildTableRow('MelonLoader Version: ', mlVersion),
                  buildTableRow('Mod Type: ', modType),
                  buildTableRow('Tags: ', tags),
                  buildTableRow('Authors: ', authors != null ? authors.join(', ') : null),
                  buildTableRow('Dependencies: ', dependencies != null ? dependencies.join(', ') : null),
                  buildTableRowBool('Working Currently: ', workingCurrently)
                ].where((w) => w != null).toList(), //Remove any nulls from list
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
            description != null ? Container(
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
                  description,
                  style: TextStyle(
                      fontSize: 15
                  ),
                ),
              ),
            ) : Container(width: 0, height: 0,),
            FittedBox(
              fit: BoxFit.contain,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Made by: ${author.startsWith("<@!") ? APIUtils.GetGithubUsername(githubLink) : author}",),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: CircleAvatar(
                        minRadius: 10,
                        maxRadius: 15,
                        foregroundImage: CachedNetworkImageProvider(APIUtils.GetGithubProfilePictureUrl(githubLink),),
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

  TableRow buildTableRow(String label, String value) {
    if(value == null) return null;
    shadeOffset == 100 ? shadeOffset = 0: shadeOffset = 100;
    return
      TableRow(
        decoration: BoxDecoration(
          color: currentTheme.currentTheme == ThemeMode.dark ? Colors.grey[600+shadeOffset] : Colors.grey[100+shadeOffset],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(label),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(value),
          ),
        ]
      );
  }
  TableRow buildTableRowBool(String label, bool value) {
    if(value == null) return null;
    shadeOffset == 100 ? shadeOffset = 0: shadeOffset = 100;
    return
      TableRow(
          decoration: BoxDecoration(
            color: currentTheme.currentTheme == ThemeMode.dark ? Colors.grey[600+shadeOffset] : Colors.grey[100+shadeOffset],
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(label),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                value ? 'Yes' : 'No',
                style: TextStyle(
                    color: !value ? Colors.red : currentTheme.currentTheme == ThemeMode.dark ? Colors.lightGreenAccent : Colors.green
                ),
              ),
            ),
          ]
      );
  }
}
