import 'package:flutter/material.dart';
import 'package:pratama_form_field_factory/Utils/pratama_Constants.dart';

class PratamaFormBuilderModel<T>{
  final PratamaFormField field;
  final T? presenter;
  final int? linkCustomIndex;

  PratamaFormBuilderModel({
    required this.field,
    this.presenter,
    this.linkCustomIndex
  });
}