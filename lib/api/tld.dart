import 'dart:convert';

import 'package:melonmanager/enums/sortmode.dart';
import 'package:http/http.dart' as http;
import 'package:melonmanager/models/tldmod.dart';

class TLD {
  static final String modsUrl = "tld.xpazeapps.com";
  static final String modsEndpoint = "api.json";
  static Future<List<TLDMod>> fetchMods(SortMode mode) async {
    List<TLDMod> mods = await TLD.getMods(modsUrl, modsEndpoint);
    return TLD.sort(mods, mode);
  }
  static Future<List<TLDMod>> getMods(String base, String endpoint) async {
    final response = await http.get(Uri.https(base, endpoint));
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      return List.from(map.values.map((e) => TLDMod.fromJson(e)));
    } else {
      throw Exception('\'$base\' responded with ${response.statusCode}');
    }
  }
  static List<TLDMod> sort(List<TLDMod> mods, SortMode mode) {
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
  static List<TLDMod> _sortNameAZ(List<TLDMod> mods)  {
    mods.sort((a, b) {
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });
    return mods;
  }
  static List<TLDMod> _sortNameZA(List<TLDMod> mods)  {
    mods.sort((a, b) {
      return a.name.toLowerCase().compareTo(b.name.toLowerCase())*-1;
    });
    return mods;
  }
  static List<TLDMod> _sortAuthorAZ(List<TLDMod> mods)  {
    mods.sort((a, b) {
      return a.displayAuthor.first.toLowerCase().compareTo(b.displayAuthor.first.toLowerCase());
    });
    return mods;
  }
  static List<TLDMod> _sortAuthorZA(List<TLDMod> mods)  {
    mods.sort((a, b) {
      return a.displayAuthor.first.toLowerCase().compareTo(b.displayAuthor.first.toLowerCase())*-1;
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