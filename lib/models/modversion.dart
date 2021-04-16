import 'dart:core';

class ModVersion {
  final int _version;
  final int approvalStatus;
  final String reason;
  final String name;
  final String modversion;
  final String vrchatversion;
  final String loaderversion;
  final String modtype;
  final String author;
  final String description;
  final String downloadlink;
  final String sourcelink;
  final String discord;
  final String hash;
  final String changelog;
  final String updatedate;

  ModVersion(this._version, this.approvalStatus, this.reason, this.name, this.modversion, this.vrchatversion, this.loaderversion, this.modtype, this.author, this.description, this.downloadlink, this.sourcelink, this.discord, this.hash, this.changelog, this.updatedate);

  /// Map json data into a version object
  ModVersion.fromJson(Map<dynamic, dynamic> json)
      : _version = json['_version'],
        approvalStatus = json['ApprovalStatus'],
        reason = json['reason'],
        name = json['name'],
        modversion = json['modversion'],
        vrchatversion = json['vrchatversion'],
        loaderversion = json['loaderversion'],
        modtype = json['modtype'],
        author = json['author'],
        description = json['description'].toString().replaceAll("\n", "\n\n"), //Sanitize for markdown support
        downloadlink = json['downloadlink'],
        sourcelink = json['sourcelink'],
        discord = json['discord'],
        hash = json['hash'],
        changelog = json['changelog'],
        updatedate = json['updatedate'];
}