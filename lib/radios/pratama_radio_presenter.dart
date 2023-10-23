import 'package:flutter/material.dart';
import 'package:pratama_form_field_factory/Utils/pratama_Constants.dart';
import 'package:pratama_form_field_factory/radios/models/pratama_radio_model.dart';

class PratamaRadioPresenter<T>{

  final List<PratamaRadioModel> groups;
  T? selectedValue;
  final PratamaStringFromDynamicCallback? validator;
  bool isNeedToShowError = false;
  final String? label;
  VoidCallback? bridgeValidate;
  ValueChanged? onExtendedSelectedRadio;

  PratamaRadioPresenter({
    required this.groups, 
    this.selectedValue,
    this.label,
    this.validator,
    this.onExtendedSelectedRadio
  });


  onSelectedRadio(T val){
    selectedValue = val;
    isNeedToShowError = false;
    onExtendedSelectedRadio?.call(val);
  }

  bool get isValid => validator?.call(selectedValue) == null;

  String?  get errorText{
    return validator!(selectedValue);
  }

  bool validate(){
    if(validator != null){
      bridgeValidate?.call();
    }
    return isValid;
  }
}