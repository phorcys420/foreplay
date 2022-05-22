import "package:fluent_ui/fluent_ui.dart";
import "package:flutter/services.dart";

import "../util/plugins.dart";
import 'addonbuttons.dart';

class AddonCard extends StatelessWidget {
  final String name;
  final String author;
  final String description;
  final String url;

  final String type;

  final void Function()? installAction;

  const AddonCard(
      {Key? key,
      required this.name,
      required this.author,
      required this.description,
      required this.url,
      required this.type,
      this.installAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Stack(children: [
      Padding(
          padding: const EdgeInsets.only(left: 4, top: 4),
          child: Wrap(children: [
            Text(name,
                textScaleFactor: 1.2,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const Padding(
                padding: EdgeInsets.only(left: 3, top: 3), child: Text("by")),
            Padding(
                padding: const EdgeInsets.only(left: 3, top: 3),
                child: Text(author,
                    style: const TextStyle(fontWeight: FontWeight.bold))),
          ])),
      Align(
          alignment: Alignment.topRight,
          child: AddonButtons(
              type: type,
              url: url,
              installAction: installAction,
              copyAction: () => Clipboard.setData(ClipboardData(text: url)))),
      Padding(
          padding: const EdgeInsets.only(left: 4, top: 35, bottom: 10),
          child: SelectableText(description)),
    ]));
  }
}

class PluginCard extends AddonCard {
  PluginCard(
      {Key? key,
      required super.name,
      required super.author,
      required super.description,
      required super.url})
      : super(
            key: key,
            type: "plugin",
            installAction: () => broadcastPlugin(url));
}
