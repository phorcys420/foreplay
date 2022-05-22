import "package:fluent_ui/fluent_ui.dart";

import "../components/addontext.dart";

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      header: const PageHeader(title: Text("Home")),
      children: [
        Wrap(children: [
          const Padding(
              padding: EdgeInsets.only(right: 3),
              child: Text("hey check out my")),
          PluginText(
              text: "best plugin",
              url:
                  "https://cumcordplugins.github.io/Condom/beefers.github.io/meatloaf/Superpowers/"),
          const Padding(
              padding: EdgeInsets.only(left: 0),
              child: Text(", it's really nice and offers a lot of features")),
        ])
      ],
    );
  }
}
