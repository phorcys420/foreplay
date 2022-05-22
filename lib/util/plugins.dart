import "package:http/http.dart" as http;

import "communication.dart";

import "dart:convert";

final pluginsUrl =
    Uri.parse("https://cumcordplugins.github.io/Condom/plugins-large.json");

Future<List<Map<String, dynamic>>> getPluginsFromDump() async {
  var response = await http.get(pluginsUrl);

  return (jsonDecode(response.body) as List)
      .map((e) => e as Map<String, dynamic>)
      .toList();
}

List<Map<String, dynamic>>? pluginList;
Future<void> refreshPluginList() async =>
    pluginList = await getPluginsFromDump();

Future<int> broadcastPlugin(String url) =>
    broadcastData({"action": "INSTALL_PLUGIN", "url": url});
