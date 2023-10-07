import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:pratama_form_field_factory/Utils/pratama_Constants.dart';

class PratamaDateTimePickerPresenter{

  DateTime? selectedDate;
  DateTimePickerLocale locale;
  PratamaStringCallback? validator;
  late TextEditingController textController;
  Duration? _selectedDuration;
  VoidCallback? onSelectedDate;
  DateTime? maxDateTime;
  DateTime? minDateTime;

  PratamaDateTimePickerPresenter({
    DateTime? initialDate, 
    this.onSelectedDate,
    this.locale = DateTimePickerLocale.id,
    this.maxDateTime,
    this.minDateTime,
    this.validator}){
    if(initialDate != null){
      selectedDate = initialDate;
      _selectedDuration = DateTime.now().difference(selectedDate!);
      
    }
    textController = TextEditingController();
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
    textController.value = TextEditingValue(
      text: formattedDate!
    );
    if(onSelectedDate != null){
      onSelectedDate!();
    }
  }
}