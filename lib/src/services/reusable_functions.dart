abstract final class ReusableFunctions {
  static String removeSpaceFromStringForDownloadingVideo(String value) {
    String res = '';
    for (int i = 0; i < value.length; i++) {
      // if (value[i] == ' ' || value[i] == '.') continue;
      if (value[i] == '-' ||
          value[i] == ":" ||
          // value[i] == "\"" ||
          value[i] == "'" ||
          value[i] == ',' ||
          // value[i] == '/' ||
          value[i] == "\\" ||
          value[i] == '@' ||
          value[i] == '!' ||
          value[i] == '\$' ||
          value[i] == '%' ||
          value[i] == '^' ||
          value[i] == '&' ||
          value[i] == '*' ||
          value[i] == '(' ||
          value[i] == ')' ||
          value[i] == '|' ||
          value[i] == '?') {
        res += '_';
        continue;
      }
      res += value[i];
    }
    return res;
  }
}
