import 'package:flutter/material.dart';
import 'package:jappeos_installer/pages/installer_page.dart';
import 'package:shade_ui/shade_ui.dart';

class WelcomePage extends InstallerPage {
  WelcomePage() : super('Welcome') {
    selectedItemId = items[0];
  }

  List<String> items = [
    'English',
    'Finnish',
    'Swedish',
    'German',
  ];

  late String selectedItemId;

  @override
  List<Widget> widget(void Function(void Function()) setState, void Function() nextPage, BuildContext context) {
    return [
      const Spacer(flex: 1),
      Text("Welcome, Please choose your language below!", style: Theme.of(context).textTheme.headlineSmall),
      const SizedBox(height: BPPresets.big),
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.circular(BPPresets.medium),
        ),
        width: 400,
        height: 300,
        child: ListView.builder(
          padding: const EdgeInsets.all(BPPresets.medium),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return ListTile(
              title: Text(item),
              dense: true,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(BPPresets.small)),
              tileColor: selectedItemId == item ? Theme.of(context).colorScheme.secondary : null,
              onTap: () {
                setState(() {
                  selectedItemId = item;
                });
              },
            );
          },
        ),
      ),
      const Spacer(flex: 1),
    ];

    /*Flexible(flex: 1, fit: FlexFit.tight, child: Row(mainAxisSize: MainAxisSize.max, children: [
        SizedBox(width: 250, child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return ListTile(
              title: Text(item),
              dense: true,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(BPPresets.small)),
              tileColor: selectedItemId == item ? Theme.of(context).colorScheme.secondary : null,
              onTap: () {
                setState(() {
                  selectedItemId = item;
                });
              },
            );
          },
        ),),
        const SizedBox(width: BPPresets.medium),
        const VerticalDivider(),
        Expanded(
          child: Center(child: Row(mainAxisSize: MainAxisSize.min, children: [
            SizedBox(
              width: 300,
              height: 150,
              child: Column(children: [
                const Expanded(child: Text("You can try JappeOS without making any changes to this computer, directly from this CD.")),
                FilledButton(onPressed: () => nextPage(), child: const Text("Try JappeOS")),
              ],),
            ),
            const SizedBox(width: 20),
            SizedBox(
              width: 300,
              height: 150,
              child: Column(children: [
                const Expanded(child: Text("Or if you're ready, you can install JappeOS alongside (or instead of) your current operating system. This shouldn't take too long.")),
                FilledButton(onPressed: () {}, child: const Text("Install JappeOS")),
              ],),
            ),
          ])),
        ),
      ])), */
  }
}
