import 'dart:core';

class TLDDownload {
  final String name;
  final String browserDownloadUrl;

  TLDDownload(this.name, this.browserDownloadUrl);

  TLDDownload.fromJson(Map<dynamic, dynamic> json)
      : name = json['name'],
        browserDownloadUrl = json['browser_download_url'];
}