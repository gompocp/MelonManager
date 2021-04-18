import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:melonmanager/api/apiutils.dart';
import 'package:melonmanager/api/tld.dart';
import 'package:melonmanager/models/tldmod.dart';



class TLDModGridTile extends StatelessWidget {
  final TLDMod mod;
  const TLDModGridTile({Key key, this.mod}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[700]
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
                      mod.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 6, top: 6),
                  child: Text(
                    mod.version,
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
                    "${mod.author}", //TODO: Use mod.displayAuthor to include other contributors
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
                  foregroundImage: CachedNetworkImageProvider(APIUtils.GetGithubProfilePictureUrl(mod.download.browserDownloadUrl),),
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
