import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:melonmanager/api/tld.dart';
import 'package:melonmanager/enums/sortmode.dart';
import 'package:melonmanager/models/tldmod.dart';
import 'package:melonmanager/widgets/melonload.dart';
import 'package:melonmanager/widgets/tldmodgridtile.dart';
import 'package:melonmanager/widgets/tldmodinfo.dart';

class TLDMods extends StatefulWidget {
  @override
  _TLDModsState createState() => _TLDModsState();
}

class _TLDModsState extends State<TLDMods> {
  List<TLDMod> tldMods = [];
  @override
  void initState() {
    super.initState();
    getMods();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:tldMods.length != 0 ? GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 300, mainAxisExtent: 200),
        itemCount: tldMods.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: GestureDetector(
                child: TLDModGridTile(
                  mod: tldMods[index],
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (builder) {
                        return TLDModInfo(tldMods: tldMods, index: index,);
                      }
                  );
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
    var data = await TLD.fetchMods(SortMode.NameAlphabeticallyAZ);
    if(!this.mounted) return; //Make sure setState() isn't called after Dispose()
    setState(() {
      this.tldMods = data;
      print('Fetched a total of ${tldMods.length} for The Long Dark');
    });
    return;
  }
}

