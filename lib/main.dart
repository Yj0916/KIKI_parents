import 'package:flutter/material.dart';
import 'package:testingflutterapp/FirstPage.dart';

void main() => runApp(KidsKeeper());

class KidsKeeper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home : FirstPage());
  }
}