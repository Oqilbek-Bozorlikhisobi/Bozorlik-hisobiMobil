import 'package:bozorlik/common/extension/number_extension.dart';
import 'package:flutter/material.dart';

class ShowBottomsheetSaveCheck extends StatefulWidget {
  const ShowBottomsheetSaveCheck({super.key});

  @override
  State<ShowBottomsheetSaveCheck> createState() => _ShowBottomsheetSaveCheckState();
}

class _ShowBottomsheetSaveCheckState extends State<ShowBottomsheetSaveCheck> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        12.vertical,
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [Container(height: 4, width: 32)]),
        12.vertical,
      ],
    );
  }
}
