import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:melonmanager/api/vrchat.dart';
import 'package:melonmanager/enums/gametype.dart';
import 'package:melonmanager/enums/sortmode.dart';
import 'package:melonmanager/models/mod.dart';
import 'package:melonmanager/widgets/melonload.dart';
import 'package:melonmanager/widgets/modgridtile.dart';


class Game extends StatefulWidget {
  final GameType gameType;
  const Game({Key key, this.gameType}) : super(key: key);
  @override
  _GameState createState() => _GameState(gameType);
}

class _GameState extends State<Game> {
  final GameType gameType;
  List<Mod> mods = [];
  _GameState(this.gameType);
  @override
  void initState() {
    super.initState();
    getMods();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: mods.length != 0 ? GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 300, mainAxisExtent: 200),
        itemCount: mods.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: GestureDetector(
                child: ModGridTile(
                  mod: mods[index],
                ),
                onTap: () {
                  /*Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(imagesUrls[index]);
                  }));*/
                },
              ),
            ),
          );
        },
      ) : Padding(
        padding: const EdgeInsets.all(20.0),
        child: MelonLoad(),
      ),
    );
  }
  void getMods() async {
    dynamic data = [];
    switch(gameType) {
      case GameType.VRChat:
        data = await VRChat.fetchMods(SortMode.NameAlphabeticallyAZ);
        break;
      case GameType.BTD6:
      case GameType.TLD:
      case GameType.AUDICA:
        break;
    }
    setState(()  {
      mods = data;
    });
    return;
  }
}
