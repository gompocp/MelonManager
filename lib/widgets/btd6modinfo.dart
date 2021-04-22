import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:melonmanager/api/apiutils.dart';
import 'package:melonmanager/models/btd6mod.dart';

import '../themes.dart';


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
                          child: Text(mod.version),
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
                          child: Text('Tags: '),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(mod.tags),
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
                          child: Text('Mod Type: '),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(mod.type),
                        ),
                      ]
                  ),
                ],
              ),
            ),
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
                  mod.description,
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
            ),
          ],
        )
    );
  }
}
