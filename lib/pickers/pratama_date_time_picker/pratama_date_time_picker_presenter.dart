import 'dart:html';

import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:pratama_form_field_factory/Utils/pratama_Constants.dart';

class PratamaDateTimePickerPresenter{

  DateTime? selectedDate;
  DateTimePickerLocale locale;
  PratamaStringCallback? validator;

  PratamaDateTimePickerPresenter({
    DateTime? initialDate, 
    this.locale = DateTimePickerLocale.id,
    this.validator}){
    if(initialDate != null){
      selectedDate = initialDate;
    }
  }

  String? getFormattedDate(){
    if(selectedDate!= null){
        return "${selectedDate!.day} ${DatePickerI18n.getLocaleMonths(locale)[selectedDate!.month - 1]} ${selectedDate!.year}";
    }
    return null;
  }

  String getButtonSelectedTitle(){
    if(locale == DateTimePickerLocale.en_us){
      return "Sekect";
    }
    return "Pilih";
  }
}