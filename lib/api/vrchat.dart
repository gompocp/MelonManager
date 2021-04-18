import 'dart:convert';

import 'package:melonmanager/enums/sortmode.dart';
import 'package:melonmanager/models/vrchatmod.dart';
import 'package:http/http.dart' as http;

class VRChat {
  static final String modsUrl = "api.vrcmg.com";
  static final String modsEndpoint = "v0/mods.json";
  static Future<List<VRChatMod>> fetchMods(SortMode mode) async {
    List<VRChatMod> mods = await VRChat.getMods(modsUrl, modsEndpoint);
    return VRChat.sort(mods, mode);
  }
  static Future<List<VRChatMod>> getMods(String base, String endpoint) async {
    final response = await http.get(Uri.https(base, endpoint));
    if (response.statusCode == 200) {
      return List<VRChatMod>.from(jsonDecode(response.body).map((model)=> VRChatMod.fromJson(model)));
    } else {
      throw Exception('\'$base\' responded with ${response.statusCode}');
    }
  }
  static List<VRChatMod> sort(List<VRChatMod> mods, SortMode mode) {
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
  static List<VRChatMod> _sortNameAZ(List<VRChatMod> mods)  {
    mods.sort((a, b) {
      return a.versions[0].name.toLowerCase().compareTo(b.versions[0].name.toLowerCase());
    });
    return mods;
  }
  static List<VRChatMod> _sortNameZA(List<VRChatMod> mods)  {
    mods.sort((a, b) {
      return a.versions[0].name.toLowerCase().compareTo(b.versions[0].name.toLowerCase())*-1;
    });
    return mods;
  }
  static List<VRChatMod> _sortAuthorAZ(List<VRChatMod> mods)  {
    mods.sort((a, b) {
      return a.versions[0].author.toLowerCase().compareTo(b.versions[0].author.toLowerCase());
    });
    return mods;
  }
  static List<VRChatMod> _sortAuthorZA(List<VRChatMod> mods)  {
    mods.sort((a, b) {
      return a.versions[0].author.toLowerCase().compareTo(b.versions[0].author.toLowerCase())*-1;
    });
    return mods;
  }
}