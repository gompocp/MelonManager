
import 'dart:core';

import 'modversion.dart';


class Mod {
  final int _id;
  final String mentionid;
  final int versionofmsg;
  final String description;
  final String uploaddate;
  final List<String> aliases;
  final List<ModVersion> versions;


  Mod(this._id, this.mentionid, this.versionofmsg, this.description, this.uploaddate, this.aliases, this.versions);

  /// Map json data into a mod object
  Mod.fromJson(Map<dynamic, dynamic> json)
      : _id = json['_id'],
        mentionid = json['mentionid'],
        versionofmsg = json['versionofmsg'],
        uploaddate = json['uploaddate'],
        description = json['description'],
        aliases = json['aliases'] != null ? List<String>.from(json['aliases']) : List<String>.empty(),
        versions = json['versions'] != null ? List<ModVersion>.from(json['versions'].map((model)=> ModVersion.fromJson(model))) : List<ModVersion>.empty();
}