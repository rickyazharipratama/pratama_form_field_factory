import 'package:flutter/material.dart';
import 'package:pratama_form_field_factory/Utils/pratama_Constants.dart';
import 'package:pratama_form_field_factory/radios/models/pratama_radio_model.dart';
import 'package:pratama_form_field_factory/radios/pratama_radio_list_tile/pratama_radio_list_tile.dart';

class PratamaRadioListTilePresenter<T>{

  final List<PratamaRadioModel> groups;
  T? selectedValue;
  final PratamaStringFromDynamicCallback? validator;
  bool isNeedToShowError = false;
  VoidCallback? bridgeValidate;
  PratamaRadioListTilePresenter({
    required this.groups, 
    this.selectedValue,
    this.validator
  });


  onSelectedRadio(T val){
    selectedValue = val;
    isNeedToShowError = false;
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