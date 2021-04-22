import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:melonmanager/api/apiutils.dart';
import 'package:melonmanager/models/tldmod.dart';

import '../themes.dart';


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
          crossAxisAlignment: CrossAxisAlignment.center,
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
                          child: Text('Working Currently: '),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              mod.error ? 'No' : 'Yes'
                            ,
                            style: TextStyle(
                              color: mod.error ? Colors.red : currentTheme.currentTheme == ThemeMode.dark ? Colors.lightGreenAccent : Colors.green
                            ),
                          ),
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
                          child: Text('Authors: '),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(mod.displayAuthor.join(', ')),
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
                          child: Text('Dependencies: '),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(mod.dependencies.join(', ')),
                        ),
                      ]
                  ),
                ],
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
                        onForegroundImageError: (_, trace) {
                          print('Failed to fetch image for ${mod.author}');
                        },
                        minRadius: 10,
                        maxRadius: 15,
                        foregroundImage: CachedNetworkImageProvider(
                          APIUtils.GetGithubProfilePictureUrl(mod.download.browserDownloadUrl),
                        ),
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
