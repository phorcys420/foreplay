import "package:fluent_ui/fluent_ui.dart";

class AddonButtons extends StatelessWidget {
  final String url;
  final String type;

  final void Function()? copyAction;
  final void Function()? installAction;

  const AddonButtons(
      {Key? key,
      required this.url,
      required this.type,
      this.copyAction,
      this.installAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      if (copyAction != null)
        Tooltip(
            message: "Copy $type URL",
            child: IconButton(
                icon: const Icon(FluentIcons.clipboard_list),
                onPressed: copyAction)),
      if (installAction != null)
        Tooltip(
            message: "Install $type",
            child: IconButton(
              icon: const Icon(FluentIcons.installation),
              onPressed: installAction,
            ))
    ]);
  }
}
