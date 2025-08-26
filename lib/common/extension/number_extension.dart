import 'package:flutter/cupertino.dart';

extension NumberExtension on num {
  SizedBox get horizontal => SizedBox(width: toDouble());

  SizedBox get vertical => SizedBox(height: toDouble());
}
