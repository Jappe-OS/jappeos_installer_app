import 'package:flutter/material.dart';
import 'package:jappeos_installer/pages/installer_page.dart';
import 'package:shade_ui/shade_ui.dart';

class WifiPage extends InstallerPage {
  WifiPage() : super('WIFI');

  int wifiConnectRadioChoice = 0;

  @override
  List<Widget> widget(void Function(void Function()) setState, void Function() nextPage, BuildContext context) {
    return [
      const Text("Connecting this device to a WIFI network allows you to install third-party-software, download updates, automatically detect your timezone, and install full support for your language."),
      const SizedBox(height: BPPresets.small),
      ListTile(
        title: const Text('Do not connect me to a WIFI network.'),
        leading: Radio(
          value: 0,
          groupValue: wifiConnectRadioChoice,
          onChanged: (value) {
            setState(() {
              wifiConnectRadioChoice = value as int;
            });
          },
        ),
      ),
      ListTile(
        title: const Text('Connect to this network:'),
        leading: Radio(
          value: 1,
          groupValue: wifiConnectRadioChoice,
          onChanged: (value) {
            setState(() {
              wifiConnectRadioChoice = value as int;
            });
          },
        ),
      ),
      const Expanded(child: Placeholder()),
    ];
  }
}
