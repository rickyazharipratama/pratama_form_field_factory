import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:pratama_form_field_factory/Utils/pratama_Constants.dart';
import 'package:pratama_form_field_factory/pickers/pratama_date_time_picker/pratama_date_time_picker.dart';
import 'package:pratama_form_field_factory/text_field/pratama_text_field_presenter.dart';

class PratamaDateTimePickerPresenter{

  DateTime? selectedDate;
  DateTimePickerLocale locale;
  PratamaStringCallback? validator;
  Duration? _selectedDuration;
  VoidCallback? onSelectedDate;
  DateTime? maxDateTime;
  DateTime? minDateTime;
  String? label;
  late PratamaTextFieldPresenter textPresenter;
  GlobalKey<PratamaDateTimePickerState> key = GlobalKey<PratamaDateTimePickerState>();

  PratamaDateTimePickerPresenter({
    DateTime? initialDate, 
    this.onSelectedDate,
    this.locale = DateTimePickerLocale.id,
    this.maxDateTime,
    this.minDateTime,
    this.label,
    this.validator}){
    if(initialDate != null){
      selectedDate = initialDate;
      _selectedDuration = DateTime.now().difference(selectedDate!);
      
    }
    textPresenter = PratamaTextFieldPresenter(
      label: label,
      isReadOnly: true,
      validator: validator??(_) => "",
      controller: TextEditingController(
        text: formattedDate
      ),
      val: formattedDate
    );
  }

  String?  get formattedDate{
    if(selectedDate!= null){
        return "${selectedDate!.day} ${DatePickerI18n.getLocaleMonths(locale)[selectedDate!.month - 1]} ${selectedDate!.year}";
    }
    return null;
  }

  Duration? get  selectedDuration{
    return _selectedDuration;
  }


  String getButtonSelectedTitle(){
    if(locale == DateTimePickerLocale.en_us){
      return "Sekect";
    }
    return "Pilih";
  }

  Duration? getDiffDateTIme(){
    if(selectedDate != null){
      return DateTime.now().difference(selectedDate!);      
    }
    return null;
  }

  int get diffYearDuration {
    if(_selectedDuration != null){
     return (_selectedDuration!.inDays / 365).floor();
    }
    return -1;
  }

  setSelectedDate(DateTime selectedDate){
    this.selectedDate = selectedDate;
    _selectedDuration = DateTime.now().difference(selectedDate);
    textPresenter.controller!.value = TextEditingValue(
      text: formattedDate!
    );
    textPresenter.isNeedToShowError = false;
    releaseFocus();
    if(onSelectedDate != null){
      onSelectedDate!();
    }
  }

  releaseFocus(){
    textPresenter.textNode.unfocus();
  }
}