import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:melonmanager/api/apiutils.dart';
import 'package:melonmanager/models/btd6mod.dart';

import '../themes.dart';
import 'btd6modinfo.dart';


class BTD6ModGridTile extends StatefulWidget {
  final BTD6Mod mod;
  const BTD6ModGridTile({Key key, this.mod}) : super(key: key);

  @override
  _BTD6ModGridTileState createState() => _BTD6ModGridTileState();
}

class _BTD6ModGridTileState extends State<BTD6ModGridTile> {
  double border = 0.0;

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
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (builder) {
              return BTD6ModInfo(mod: widget.mod);
            }
        );
      },
      onHover: (isHovering) {
        if(isHovering){
          setState((){
            border = 3.0;
          });
        }else{
          setState((){
            border = 0.0;
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: border, style: border == 0 ? BorderStyle.none : BorderStyle.solid),
          color: currentTheme.currentTheme == ThemeMode.dark ? Colors.grey[700] : Colors.grey[300],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6, top: 6),
                    child: Text(
                      widget.mod.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 6, top: 6),
                  child: Text(
                    widget.mod.version,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: CachedNetworkImage(
                imageUrl: widget.mod.pngUrl,
                errorWidget: (context, str, dyn) {
                  return Container();
                },
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 6, bottom: 6),
                    child: Text(
                      "${widget.mod.author}",
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
                    foregroundImage: CachedNetworkImageProvider(APIUtils.GetGithubProfilePictureUrl(widget.mod.downloadUrl),),
                    backgroundColor: Colors.white,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
