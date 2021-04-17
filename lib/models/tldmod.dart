import 'dart:convert';
import 'dart:core';

import 'package:melonmanager/models/tlddownload.dart';

class TLDMod {
  final String name;
  final String author;
  final String repoName;
  final List<String> displayAuthor;
  final List<String> dependencies;
  final String version;
  final bool error;
  final TLDDownload download;

  TLDMod(this.name, this.author, this.repoName, this.displayAuthor, this.dependencies, this.version, this.error, this.download);

  /// Map json data into a mod object
  TLDMod.fromJson(Map<dynamic, dynamic> json)
      : name = json['Name'],
        author = json['Author'],
        repoName = json['RepoName'],
        displayAuthor = json['DisplayAuthor'] != null ? List<String>.from(json['DisplayAuthor']) : List<String>.empty(),
        dependencies = json['Dependencies'] != null ? List<String>.from(json['Dependencies']) : List<String>.empty(),
        version = json['Version'],
        error = json['Error'],
        download = json['Download'] != null ? TLDDownload.fromJson(json['Download']) : null;
}