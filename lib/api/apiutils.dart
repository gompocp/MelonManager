class APIUtils {
  static String GetGithubUsername(String sourceLink) {
    var match = RegExp("github.com\/([0-9a-zA-Z\-]+)\/").firstMatch(sourceLink);
    if(match == null) return "github";
    return match.group(1);
  }
  static String GetGithubProfilePictureUrl(String link) {
    return "https://github.com/${GetGithubUsername(link)}.png?size=40";
  }
}