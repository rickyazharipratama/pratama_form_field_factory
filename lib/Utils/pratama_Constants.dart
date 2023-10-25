// ignore_for_file: file_names

import 'package:flutter/material.dart';

typedef PratamaStringCallback = String? Function(String?)?;
typedef PratamaStringFromDynamicCallback = String? Function(dynamic);
typedef PratamaVoidCallback = void Function(VoidCallback callback);
typedef PratamaCustomFormLayout = Widget Function(BuildContext context, Widget child);


enum PratamaFormField{
  textField,
  dateTIemPicker,
  radio,
  customField
}