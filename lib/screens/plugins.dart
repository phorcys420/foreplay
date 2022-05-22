import "../util/plugins.dart";
import "../components/addoncard.dart";

import "package:fluent_ui/fluent_ui.dart";

class Plugins extends StatefulWidget {
  const Plugins({Key? key}) : super(key: key);

  @override
  _PluginsState createState() => _PluginsState();
}

class _PluginsState extends State<Plugins> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.scrollable(
        header: PageHeader(
            title: Row(children: [
          const Text("Plugins"),
          const Spacer(),
          Tooltip(
              message: "Refresh plugin list",
              child: IconButton(
                  icon: const Icon(FluentIcons.refresh),
                  onPressed: () async {
                    await refreshPluginList();
                    setState(() {});
                  }))
        ])),
        children: (pluginList != null)
            ? pluginList!
                .map((e) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: PluginCard(
                        name: e["name"],
                        author: e["author"],
                        description: e["description"],
                        url: "https://${e["url"]}")))
                .toList()
            : [const Text("There was an error fetching the plugin list.")]);
  }
}
