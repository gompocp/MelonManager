import 'dart:convert';

import 'package:melonmanager/enums/sortmode.dart';
import 'package:http/http.dart' as http;
import 'package:melonmanager/models/btd6mod.dart';

class BTD6 {
  static final String modsUrl = "raw.githubusercontent.com";
  static final String modsEndpoint = "Inferno-Dev-Team/Inferno-Omnia/main/api.json";
  static Future<List<BTD6Mod>> fetchMods(SortMode mode) async {
    List<BTD6Mod> mods = await BTD6.getMods(modsUrl, modsEndpoint);
    return BTD6.sort(mods, mode);
  }
  static Future<List<BTD6Mod>> getMods(String base, String endpoint) async {
    final response = await http.get(Uri.https(base, endpoint));
    if (response.statusCode == 200) {
      return List<BTD6Mod>.from(jsonDecode(response.body).map((model)=> BTD6Mod.fromJson(model)));
    } else {
      throw Exception('\'$base\' responded with ${response.statusCode}');
    }
  }
  static List<BTD6Mod> sort(List<BTD6Mod> mods, SortMode mode) {
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
  static List<BTD6Mod> _sortNameAZ(List<BTD6Mod> mods)  {
    mods.sort((a, b) {
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });
    return mods;
  }
  static List<BTD6Mod> _sortNameZA(List<BTD6Mod> mods)  {
    mods.sort((a, b) {
      return a.name.toLowerCase().compareTo(b.name.toLowerCase())*-1;
    });
    return mods;
  }
  static List<BTD6Mod> _sortAuthorAZ(List<BTD6Mod> mods)  {
    mods.sort((a, b) {
      return a.author.toLowerCase().compareTo(b.author.toLowerCase());
    });
    return mods;
  }
  static List<BTD6Mod> _sortAuthorZA(List<BTD6Mod> mods)  {
    mods.sort((a, b) {
      return a.author.toLowerCase().compareTo(b.author.toLowerCase())*-1;
    });
    return mods;
  }
}