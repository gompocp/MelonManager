import 'dart:core';

class BTD6Mod {
  final String name;
  final String melonName;
  final String type;
  final String version;
  final String author;
  final String description;
  final String tags;
  final String downloadUrl;
  final String pngUrl;

  BTD6Mod(this.name, this.melonName, this.type, this.version, this.author, this.description, this.tags, this.downloadUrl, this.pngUrl);

  BTD6Mod.fromJson(Map<dynamic, dynamic> json)
      : name = json['Name'],
        melonName = json['MelonName'],
        type = json['Type'],
        version = json['Version'],
        author = json['Author'],
        description = json['Description'],
        tags = json['Tags'],
        downloadUrl = json['DownloadUrl'],
        pngUrl = json['PNGUrl'];
}