import "package:fluent_ui/fluent_ui.dart";
import "package:flutter/services.dart";

import "../util/plugins.dart";
import "addonbuttons.dart";

class AddonText extends StatelessWidget {
  final String text;
  final String url;
  final String type;

  final void Function(BuildContext)? installAction;

  const AddonText(
      {Key? key,
      required this.text,
      required this.url,
      required this.type,
      this.installAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flyout(
        openMode: FlyoutOpenMode.longHover,
        longHoverDuration: const Duration(milliseconds: 700),
        verticalOffset: 10,
        horizontalOffset: 0,
        placement: FlyoutPlacement.start,
        content: (context) => Card(
            padding: const EdgeInsets.all(4.0),
            child: AddonButtons(
                url: url,
                type: type,
                copyAction: () {
                  Clipboard.setData(ClipboardData(text: url));
                  Navigator.pop(context);
                },
                installAction: installAction != null
                    ? () => installAction!(context)
                    : null)),
        child: Text(text,
            style: const TextStyle(decoration: TextDecoration.underline)));
  }
}

class PluginText extends AddonText {
  PluginText({Key? key, required super.url, required super.text})
      : super(
            key: key,
            type: "plugin",
            installAction: (context) {
              Navigator.pop(context);
              broadcastPlugin(url);
            });
}
