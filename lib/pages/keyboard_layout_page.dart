import 'package:flutter/material.dart';
import 'package:jappeos_installer/pages/installer_page.dart';
import 'package:shade_ui/shade_ui.dart';

class KeyboardLayoutPage extends InstallerPage {
  KeyboardLayoutPage() : super('Keyboard Layout');

  Map<String, Set<String>> items = {
    "English (US)": {"English (US)", "English (US) - Cherokee"}
  };

  MapEntry<String, Set<String>>? selectedItemId;
  String? selectedSubItemId;

  @override
  List<Widget> widget(void Function(void Function()) setState, void Function() nextPage, BuildContext context) {
    return [
      Expanded(child: Row(children: [
        Expanded(child:ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items.entries.elementAt(index);
            final key = item.key;
            return ListTile(
              title: Text(key),
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
        )),
        if (selectedItemId != null) ... [
          const SizedBox(width: BPPresets.small),
          const VerticalDivider(),
          const SizedBox(width: BPPresets.small),
          Expanded(child: ListView.builder(
            itemCount: selectedItemId!.value.length,
            itemBuilder: (context, index) {
              final item = selectedItemId!.value.elementAt(index);
              return ListTile(
                title: Text(item),
                dense: true,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(BPPresets.small)),
                tileColor: selectedSubItemId == item ? Theme.of(context).colorScheme.secondary : null,
                onTap: () {
                  setState(() {
                    selectedSubItemId = item;
                  });
                },
              );
            },
          )),
        ]
      ])),
      const SizedBox(height: BPPresets.small),
      const Divider(),
      const SizedBox(height: BPPresets.small),
      const TextField(decoration: InputDecoration(labelText: "Test your keyboard here")),
    ];
  }
}
