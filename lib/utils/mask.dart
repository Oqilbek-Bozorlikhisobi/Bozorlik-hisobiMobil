import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
var maskFormatterPhone = MaskTextInputFormatter(
  mask: '+998 (##) ###-##-##',
  filter: {"#": RegExp(r'[0-9]')},
  type: MaskAutoCompletionType.lazy,
);
var maskFormatter = MaskTextInputFormatter(
  mask: '+998 (##) ***-##-##',
  filter: {"#": RegExp(r'[0-9]')},
  type: MaskAutoCompletionType.lazy,
);

var maskFormatter2 = MaskTextInputFormatter(
  mask: '+998 ## *** ####',
  filter: {"#": RegExp(r'[0-9]')},
  type: MaskAutoCompletionType.lazy,
);
String maskPhoneNumber(String phoneNumber) {

  if (phoneNumber.length >= 17) {

    String prefix = phoneNumber.substring(0, 10);
    String middle = "***";
    String suffix = phoneNumber.substring(13);

    return '$prefix$middle$suffix';
  }

  return phoneNumber;
}