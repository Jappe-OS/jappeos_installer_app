import 'package:flutter/material.dart';

abstract class InstallerPage {
  String title;

  List<Widget> widget(void Function(void Function()) setState, void Function() nextPage, BuildContext context);

  InstallerPage(this.title);
}
