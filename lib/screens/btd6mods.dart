import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:melonmanager/api/btd6.dart';
import 'package:melonmanager/enums/sortmode.dart';
import 'package:melonmanager/models/btd6mod.dart';
import 'package:melonmanager/widgets/melonload.dart';
import 'package:melonmanager/widgets/modgridtile.dart';

class BTD6Mods extends StatefulWidget {
  @override
  _BTD6ModsState createState() => _BTD6ModsState();
}

class _BTD6ModsState extends State<BTD6Mods> {
  List<BTD6Mod> btd6Mods = [];
  @override
  void initState() {
    super.initState();
    getMods();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: btd6Mods.length != 0 ? GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 300, mainAxisExtent: 200),
        itemCount: btd6Mods.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: ModGridTile(
                name: btd6Mods[index].name,
                version: btd6Mods[index].version,
                description: btd6Mods[index].description,
                author: btd6Mods[index].author,
                tags: btd6Mods[index].tags,
                modType: btd6Mods[index].type,
                imageUrl: btd6Mods[index].pngUrl,
                githubLink: btd6Mods[index].downloadUrl,
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
    var data = await BTD6.fetchMods(SortMode.NameAlphabeticallyAZ);
    if(!this.mounted) return; //Make sure setState() isn't called after Dispose()
    setState(() {
      this.btd6Mods = data;
      print('Fetched a total of ${btd6Mods.length} for BloonsTD6');
    });
    return;
  }
}

