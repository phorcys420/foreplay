import 'dart:io';

import "package:fluent_ui/fluent_ui.dart";
import "package:flutter/foundation.dart";
import 'package:foreplay/screens/redirectscreen.dart';
import "package:provider/provider.dart";
import "package:system_theme/system_theme.dart";
import "package:url_strategy/url_strategy.dart";
import "package:window_manager/window_manager.dart";

import "screens/home.dart";
import "screens/install.dart";
import "screens/plugins.dart";
import "theme.dart";
import "util/plugins.dart";

const String appTitle = "Foreplay";

final isDesktop = kIsWeb == false &&
    [
      TargetPlatform.windows,
      TargetPlatform.linux,
      TargetPlatform.macOS,
    ].contains(defaultTargetPlatform);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb ||
      [TargetPlatform.windows, TargetPlatform.android]
          .contains(defaultTargetPlatform)) {
    SystemTheme.accentColor.load();
  }

  refreshPluginList();

  setPathUrlStrategy();

  if (isDesktop) {
    await WindowManager.instance.ensureInitialized();
    windowManager.waitUntilReadyToShow().then((_) async {
      await windowManager.setSize(const Size(755, 545));
      await windowManager.setMinimumSize(const Size(755, 545));
      await windowManager.center();
      await windowManager.show();
      await windowManager.setPreventClose(true);
      await windowManager.setSkipTaskbar(false);
    });
  }

  runApp(const Foreplay());
}

class Foreplay extends StatelessWidget {
  const Foreplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppTheme(),
      builder: (context, _) {
        final appTheme = context.watch<AppTheme>();
        return FluentApp(
          title: appTitle,
          themeMode: appTheme.mode,
          debugShowCheckedModeBanner: false,
          initialRoute: "/",
          routes: {
            "/": (_) => const HomePage(),
            "/plugins": (_) => const Plugins()
          },
          color: appTheme.color,
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            accentColor: appTheme.color,
            visualDensity: VisualDensity.standard,
            focusTheme: FocusThemeData(
              glowFactor: is10footScreen() ? 2.0 : 0.0,
            ),
          ),
          theme: ThemeData(
            accentColor: appTheme.color,
            visualDensity: VisualDensity.standard,
            focusTheme: FocusThemeData(
              glowFactor: is10footScreen() ? 2.0 : 0.0,
            ),
          ),
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WindowListener {
  int index = 0;

  final settingsController = ScrollController();
  final viewKey = GlobalKey();

  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    settingsController.dispose();
    super.dispose();
  }

  @override
  void onWindowClose() async {
    windowManager.destroy();
    exit(0);
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppTheme>();
    return NavigationView(
      key: viewKey,
      appBar: NavigationAppBar(
          automaticallyImplyLeading: false,
          title: () {
            if (!kIsWeb) {
              return const DragToMoveArea(child: Align());
            }
          }(),
          height: 10.0),
      pane: NavigationPane(
        header: Container(),
        selected: index,
        onChanged: (i) => setState(() => index = i),
        size: const NavigationPaneSize(
          openMinWidth: 110,
          openMaxWidth: 110,
        ),
        displayMode: appTheme.displayMode,
        indicator: null,
        items: [
          PaneItem(
            icon: const Icon(FluentIcons.home),
            title: const Text("Home"),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.installation),
            title: const Text("Install"),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.puzzle),
            title: const Text("Plugins"),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.color),
            title: const Text("Themes"),
          ),
        ],
      ),
      content: NavigationBody(
          index: index, children: const [Home(), Install(), Plugins()]),
    );
  }
}
