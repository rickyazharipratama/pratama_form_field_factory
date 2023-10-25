import 'package:flutter/material.dart';
import 'package:pratama_form_field_factory/Utils/pratama_Constants.dart';
import 'package:pratama_form_field_factory/text_field/pratama_text_field.dart';

class PratamaTextFieldPresenter{

  late final TextEditingController  textController;
  final PratamaStringCallback? validator;
  final String? label;
  final TextInputType? keyboardType;
  final int maxLine;
  final bool isReadOnly;
  final TextEditingController? controller;
  final bool isObscured;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChange;
  VoidCallback? onEditingComplete; 
  String? _val;
  final GlobalKey<PratamaTextFieldState> key = GlobalKey<PratamaTextFieldState>();
  VoidCallback? onExtendValidation;
  final bool? isEnabled;
  bool isNeedToShowError = false;
  final FocusNode textNode = FocusNode();

  PratamaTextFieldPresenter({
    String? val, 
    this.validator,
    this.label,
    this.keyboardType,
    this. maxLine = 1,
    this.isReadOnly = false,
    this.controller,
    this.onTap,
    this.isObscured = false,
    this.onChange,
    this.onEditingComplete,
    this.isEnabled = true
  }){
    _val = val;
    textController =  controller ?? TextEditingController(text: _val);
  }

  // ignore: unnecessary_getters_setters
  String? get val => _val;
  
  set val(String? val){
    _val = val;
  }

  bool get isValid => validator?.call(textController.value.text) == null;

  String? get errorMessage => validator?.call(textController.value.text);


  bool validate(){
    if(validator != null){
        onExtendValidation?.call();
    }
    return isValid;
  }
}