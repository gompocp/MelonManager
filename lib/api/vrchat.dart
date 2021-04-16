import 'package:melonmanager/enums/sortmode.dart';
import 'package:melonmanager/models/mod.dart';


import 'api.dart';

class VRChat {
  static final String modsUrl = "api.vrcmg.com";
  static final String modsEndpoint = "v0/mods.json";
  static Future<List<Mod>> fetchMods(SortMode mode) async {
    List<Mod> mods = await API.getMods(modsUrl, modsEndpoint);
    return API.sort(mods, mode);
  }

}