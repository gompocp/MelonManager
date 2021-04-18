import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:melonmanager/api/vrchat.dart';
import 'package:melonmanager/enums/sortmode.dart';
import 'package:melonmanager/models/vrchatmod.dart';
import 'package:melonmanager/widgets/melonload.dart';
import 'package:melonmanager/widgets/vrchatmodgridtile.dart';
import 'package:melonmanager/widgets/vrchatmodinfo.dart';



class VRChatMods extends StatefulWidget {
  @override
  _VRChatModsState createState() => _VRChatModsState();
}

class _VRChatModsState extends State<VRChatMods> {
  List<VRChatMod> vrcMods = [];
  @override
  void initState() {
    super.initState();
    getMods();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: vrcMods.length != 0 ? GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 300, mainAxisExtent: 200),
        itemCount: vrcMods.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: GestureDetector(
                child: VRChatModGridTile(
                  mod: vrcMods[index],
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (builder) {
                        return VRChatModInfo(mod: vrcMods[index]);
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
    var data = await VRChat.fetchMods(SortMode.NameAlphabeticallyAZ);
    if(!this.mounted) return; //Make sure setState() isn't called after Dispose()
    setState(() {
      this.vrcMods = data;
      print('Fetched a total of ${vrcMods.length} for VRChat');
    });
    return;
  }
}

