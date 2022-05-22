/*import "package:cumtools/main.dart";
import "package:fluent_ui/fluent_ui.dart";

import "../components/plugincard.dart";
import '../util/communication.dart';

class Themes extends StatefulWidget {
  const Themes({Key? key}) : super(key: key);

  @override
  _ThemesState createState() => _ThemesState();
}

class _ThemesState extends State<Themes> {
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
          const Text("Themes"),
          const Spacer(),
          Tooltip(
              message: "Refresh theme list",
              child: IconButton(
                  icon: const Icon(FluentIcons.refresh),
                  onPressed: () async {
                    setState(() {});
                  }))
        ])),
        children: plugins
            .map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: PluginCard(e["name"], e["author"], e["description"],
                    "https://${e["url"]}")))
            .toList());
  }
}*/