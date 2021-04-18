class APIUtils {
  static String GetGithubUsername(String sourceLink) {
    RegExp regex = RegExp("github.com\/[0-9a-zA-Z\-]+\/");
    String regexResult = regex.stringMatch(sourceLink);
    if(regexResult == null) return "github";
    return regexResult.substring(11, regexResult.length-1);
  }
  static String GetGithubProfilePictureUrl(String link) {
    return "https://github.com/${GetGithubUsername(link)}.png?size=40";
  }
}