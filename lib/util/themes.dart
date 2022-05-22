/*import "dart:convert";

import "package:http/http.dart" as http;

final List<Uri> repos = [
  Uri.parse(
      "https://raw.githubusercontent.com/CumcordThemes/Cumsock/master/repo.json"),
  Uri.parse(
      "https://raw.githubusercontent.com/yellowsink/bdthemesmirror/gh-pages/repo.json")
];

Future<List<Map<String, dynamic>>> getThemesFromRepo(Uri repo) async {

}

Future<List<Map<String, dynamic>>> getThemes() async {
  List<Future<List<Map<String, dynamic>>>> futures = [];

  for (var repo in repos) {
    futures.add(getThemesFromRepo(repo));
  }

  List<Map<String, dynamic>> results = [].addAll(await Future.wait<List<Map<String, dynamic>>>(futures));

  return ([] as List<Map<String, dynamic>>).addAll(results);
}

List<Map<String, dynamic>>? themeList;
Future<void> refreshThemeList() async =>
    themeList = await getThemes();
*/