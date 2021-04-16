import 'dart:convert';

import 'package:melonmanager/enums/sortmode.dart';
import 'package:melonmanager/models/mod.dart';
import 'package:http/http.dart' as http;

class API {
  static Future<List<Mod>> getMods(String base, String endpoint) async {
    final response = await http.get(Uri.https(base, endpoint));
    if (response.statusCode == 200) {
      return List<Mod>.from(jsonDecode(response.body).map((model)=> Mod.fromJson(model)));
    } else {
      throw Exception('\'$base\' responded with ${response.statusCode}');
    }
  }
  static List<Mod> sort(List<Mod> mods, SortMode mode) {
    switch(mode) {
      case SortMode.AuthorAlphabeticallyAZ:
        return _sortAuthorAZ(mods);
      case SortMode.AuthorAlphabeticallyZA:
        return _sortAuthorZA(mods);
      case SortMode.NameAlphabeticallyZA:
        return _sortNameZA(mods);
      case SortMode.NameAlphabeticallyAZ:
      default:
        return _sortNameAZ(mods);
    }
  }
  static List<Mod> _sortNameAZ(List<Mod> mods)  {
    mods.sort((a, b) {
      return a.versions[0].name.toLowerCase().compareTo(b.versions[0].name.toLowerCase());
    });
    return mods;
  }
  static List<Mod> _sortNameZA(List<Mod> mods)  {
    mods.sort((a, b) {
      return a.versions[0].name.toLowerCase().compareTo(b.versions[0].name.toLowerCase())*-1;
    });
    return mods;
  }
  static List<Mod> _sortAuthorAZ(List<Mod> mods)  {
    mods.sort((a, b) {
      return a.versions[0].author.toLowerCase().compareTo(b.versions[0].author.toLowerCase());
    });
    return mods;
  }
  static List<Mod> _sortAuthorZA(List<Mod> mods)  {
    mods.sort((a, b) {
      return a.versions[0].author.toLowerCase().compareTo(b.versions[0].author.toLowerCase())*-1;
    });
    return mods;
  }
  static String getGithubUsername(String sourceLink) {
    RegExp regex = RegExp("github.com\/[0-9a-zA-Z\-]+\/");
    String regexResult = regex.stringMatch(sourceLink);
    if(regexResult == null) return "github";
    return regexResult.substring(11, regexResult.length-1);
  }
}