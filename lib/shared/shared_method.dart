import 'package:bank/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

customsnackbar(BuildContext context, String message) {
  Flushbar(
    message: message,
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: redColor,
    duration: Duration(
      seconds: 2,
    ),
  ).show(context);
}

String formatcurrency(num number, {String symbol = 'Rp.'}) {
  return NumberFormat.currency(
    locale: 'id',
    symbol: symbol,
    decimalDigits: 0,
  ).format(number);
}

Future<XFile?> selectImage() async {
  XFile? selectedimage =
      await ImagePicker().pickImage(source: ImageSource.gallery);

  return selectedimage;
}
