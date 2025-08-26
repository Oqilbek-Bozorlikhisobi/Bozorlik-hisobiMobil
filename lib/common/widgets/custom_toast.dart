import 'package:flutter/cupertino.dart';
import 'package:toastification/toastification.dart';

dynamic showCustomToast({
  ToastificationType type = ToastificationType.success,
  required String title,
}) {
  return toastification.show(
    type: type,
    style: ToastificationStyle.flat,
    title: Text(title),
    autoCloseDuration: const Duration(seconds: 3),
  );
}
