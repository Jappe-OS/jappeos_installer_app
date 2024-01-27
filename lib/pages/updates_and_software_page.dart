import 'package:flutter/material.dart';
import 'package:jappeos_installer/pages/installer_page.dart';

class UpdatesAndSoftwarePage extends InstallerPage {
  UpdatesAndSoftwarePage() : super('Updates & Software');

  int installationTypeChoice = 0;
  bool installUpdatesNow = true;

  @override
  List<Widget> widget(void Function(void Function()) setState, void Function() nextPage, BuildContext context) {
    return [
      Text("Installation Type", style: Theme.of(context).textTheme.titleLarge),
      ListTile(
        title: const Text('Minimal Installation'),
        subtitle: const Text('Web browser and system utilities.'),
        leading: Radio(
          value: 0,
          groupValue: installationTypeChoice,
          onChanged: (value) {
            setState(() {
              installationTypeChoice = value as int;
            });
          },
        ),
      ),
      ListTile(
        title: const Text('Normal Installation'),
        subtitle: const Text('Web browser, system utilities, media players, office apps...'),
        leading: Radio(
          value: 1,
          groupValue: installationTypeChoice,
          onChanged: (value) {
            setState(() {
              installationTypeChoice = value as int;
            });
          },
        ),
      ),
      Text("Updates", style: Theme.of(context).textTheme.titleLarge),
      ListTile(
        title: const Text('Install Updates While Installing JappeOS'),
        subtitle: const Text('This saves time after installation.'),
        leading: Checkbox(
          value: installUpdatesNow,
          onChanged: (value) {
            setState(() {
              installUpdatesNow = value as bool;
            });
          },
        ),
      ),
      //const Expanded(child: Placeholder()),
    ];
  }
}
