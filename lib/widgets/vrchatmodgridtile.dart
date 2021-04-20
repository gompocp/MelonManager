import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:melonmanager/api/apiutils.dart';
import 'package:melonmanager/api/vrchat.dart';
import 'package:melonmanager/models/vrchatmod.dart';

import '../themes.dart';


class VRChatModGridTile extends StatefulWidget {
  final VRChatMod mod;
  const VRChatModGridTile({Key key, this.mod}) : super(key: key);

  @override
  _VRChatModGridTileState createState() => _VRChatModGridTileState();
}

class _VRChatModGridTileState extends State<VRChatModGridTile> {

  void _listener() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    currentTheme.addListener(_listener);
  }

  @override
  void dispose() {
    currentTheme.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: currentTheme.currentTheme == ThemeMode.dark ? Colors.grey[700] : Colors.grey[300],
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6, top: 6),
                    child: Text(
                      widget.mod.versions[0].name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 6, top: 6),
                  child: Text(
                    widget.mod.versions[0].modversion,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 6, bottom: 6),
                  child: Text(
                    "${widget.mod.versions[0].author.startsWith("<@!") ? APIUtils.GetGithubUsername(widget.mod.versions[0].sourcelink) : widget.mod.versions[0].author}",
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 6, bottom: 6),
                child: CircleAvatar(
                  minRadius: 10,
                  maxRadius: 15,
                  foregroundImage: CachedNetworkImageProvider(APIUtils.GetGithubProfilePictureUrl(widget.mod.versions[0].sourcelink),),
                  backgroundColor: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
