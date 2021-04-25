import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:melonmanager/api/apiutils.dart';
import 'package:melonmanager/widgets/modinfo.dart';

import '../themes.dart';


class ModGridTile extends StatefulWidget {
  final String name;
  final String version;
  final String imageUrl;
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
  const ModGridTile({Key key, @required this.name, @required this.version, @required this.author, @required this.githubLink, this.imageUrl, this.description, this.vrcVersion, this.mlVersion, this.modType, this.tags, this.workingCurrently, this.authors, this.dependencies}) : super(key: key);

  @override
  _ModGridTileState createState() => _ModGridTileState();
}

class _ModGridTileState extends State<ModGridTile> {
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
              return ModInfo(
                name: widget.name,
                version: widget.version,
                author: widget.author,
                githubLink: widget.githubLink,
                modType: widget.modType,
                mlVersion: widget.mlVersion,
                vrcVersion: widget.vrcVersion,
                description: widget.description,
                dependencies: widget.dependencies,
                authors: widget.authors,
                tags: widget.tags,
                workingCurrently: widget.workingCurrently,
              );
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
                      widget.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 6, top: 6),
                  child: Text(
                    widget.version,
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
                child: widget.imageUrl == null ? Container() :
                CachedNetworkImage(
                  imageUrl: widget.imageUrl,
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
                      "${widget.author.startsWith("<@!") ? APIUtils.GetGithubUsername(widget.githubLink) : widget.author}", //Why do people use their @ in their submission REEEEEEEEEEEEEEE
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
                    onForegroundImageError: (_, stack) {
                      print('Failed to fetch github profile picture for ${widget.author}');
                    },
                    foregroundImage: CachedNetworkImageProvider(APIUtils.GetGithubProfilePictureUrl(widget.githubLink),),
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
