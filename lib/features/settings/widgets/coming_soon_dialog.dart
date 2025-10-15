import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

void showComingSoon({required BuildContext context}){
  showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text('coming_soon'.tr()),
      actions: [
        CupertinoDialogAction(
          child: Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    ),
  );
}