import "package:fluent_ui/fluent_ui.dart";

class Install extends StatefulWidget {
  const Install({Key? key}) : super(key: key);

  @override
  _InstallState createState() => _InstallState();
}

class _InstallState extends State<Install> {
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
      header: const PageHeader(title: Text("Install")),
      children: [
        Align(
          alignment: Alignment.center,
          child: Wrap(
            children: [
              Button(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        ButtonState.all(Color.fromARGB(255, 72, 69, 69)),
                  ),
                  child: const Text("e")),
            ],
          ),
        )
      ],
    );
  }
}
