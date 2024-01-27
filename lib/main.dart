import 'package:flutter/material.dart';
import 'package:jappeos_installer/pages/installation_type.dart';
import 'package:jappeos_installer/pages/installer_page.dart';
import 'package:jappeos_installer/pages/updates_and_software_page.dart';
import 'package:shade_ui/shade_ui.dart';

import 'pages/keyboard_layout_page.dart';
import 'pages/welcome_page.dart';
import 'pages/wifi_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ShadeApp(
      customThemeProperties: ShadeCustomThemeProperties(ThemeMode.dark, null, false),
      home: const MyHomePage(),
    );
  }
}

class SetupInfo {
  int language = 0;
  int keyboardLayout = 0;
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController(initialPage: 0);
  final SetupInfo _setupInfo = SetupInfo();

  final List<InstallerPage> pages = [WelcomePage(), KeyboardLayoutPage(), WifiPage(), UpdatesAndSoftwarePage(), InstallationTypePage()];
  String currentPageTitle = "";
  double currentPage = 0;

  @override
  void initState() {
    super.initState();
    currentPageTitle = pages[0].title;
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page ?? 0;
        currentPageTitle = pages[_pageController.page?.toInt() ?? 0].title;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(currentPageTitle)),
      body: Padding(
        padding: const EdgeInsets.all(BPPresets.medium),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                children: pages
                    .map((e) => Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: currentPage == 0 ? CrossAxisAlignment.center : CrossAxisAlignment.start, children: [
                          const SizedBox(height: 10),
                          ...e.widget(setState, () {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.ease,
                            );
                        }, context),
                        ]))
                    .toList(),
              ),
            ),
            const SizedBox(height: BPPresets.medium),
            SizedBox(
              height: 35,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FilledButton(
                    onPressed: currentPage != 0 ? () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.ease,
                      );
                    } : null,
                    child: const Text("Previous"),
                  ),
                  const Spacer(flex: 1),
                  ElevatedButton(
                    child: const Text("Next"),
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.ease,
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void setupDone(SetupInfo si) {}
}
