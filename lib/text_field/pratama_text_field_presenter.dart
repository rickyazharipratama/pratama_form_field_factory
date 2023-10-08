import 'package:flutter/material.dart';
import 'package:pratama_form_field_factory/Utils/pratama_Constants.dart';

class PratamaTextFieldPresenter{

  late final TextEditingController  textController;
  final PratamaStringCallback? validator;
  final String label;
  final TextInputType? keyboardType;
  final int? maxLine;
  final bool isReadOnly;
  String? _val;

  PratamaTextFieldPresenter({
    String? val, 
    this.validator,
    required this.label,
    this.keyboardType,
    this. maxLine,
    this.isReadOnly = false
  }){
    _val = val;
    textController = TextEditingController(text: _val);
  }

  // ignore: unnecessary_getters_setters
  String? get val => _val;
  
  set val(String? val){
    _val = val;
  }
}