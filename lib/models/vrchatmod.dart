import 'dart:core';

import 'vrchatmodversion.dart';


class VRChatMod {
  final int _id;
  final String mentionid;
  final int versionofmsg;
  final String description;
  final String uploaddate;
  final List<String> aliases;
  final List<VRChatModVersion> versions;


  VRChatMod(this._id, this.mentionid, this.versionofmsg, this.description, this.uploaddate, this.aliases, this.versions);

  /// Map json data into a mod object
  VRChatMod.fromJson(Map<dynamic, dynamic> json)
      : _id = json['_id'],
        mentionid = json['mentionid'],
        versionofmsg = json['versionofmsg'],
        uploaddate = json['uploaddate'],
        description = json['description'],
        aliases = json['aliases'] != null ? List<String>.from(json['aliases']) : List<String>.empty(),
        versions = json['versions'] != null ? List<VRChatModVersion>.from(json['versions'].map((model)=> VRChatModVersion.fromJson(model))) : List<VRChatModVersion>.empty();
}