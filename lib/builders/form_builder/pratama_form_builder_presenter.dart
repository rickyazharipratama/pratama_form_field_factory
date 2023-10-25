import 'package:pratama_form_field_factory/Utils/pratama_Constants.dart';
import 'package:pratama_form_field_factory/builders/form_builder/pratama_form_builder_model.dart';
import 'package:pratama_form_field_factory/pickers/pratama_date_time_picker/pratama_date_time_picker_presenter.dart';
import 'package:pratama_form_field_factory/radios/pratama_radio_presenter.dart';
import 'package:pratama_form_field_factory/text_field/pratama_text_field_presenter.dart';

class PratamaFormBuilderPresenter{

  late List<PratamaFormBuilderModel> fields;
  

  PratamaFormBuilderPresenter();

  void setFields(List<PratamaFormBuilderModel> vals){
    fields = vals;
  }

  bool validateForm(){
    bool isValid = true;
    for (PratamaFormBuilderModel field in fields) {
      bool? tempValid = getValidPresenter(field);
      if(isValid && tempValid != null){
        if(!tempValid){
          isValid = tempValid;
        }
      }
    }
    return isValid;
  }

  bool? getValidPresenter(PratamaFormBuilderModel field){
    if(field.field == PratamaFormField.textField){
      PratamaTextFieldPresenter presenter =  field.presenter as PratamaTextFieldPresenter;
      return presenter.validate();
    }else if(field.field == PratamaFormField.dateTIemPicker){
      PratamaDateTimePickerPresenter presenter = field.presenter as PratamaDateTimePickerPresenter;
      return presenter.textPresenter!.validate();
    }else if(field.field == PratamaFormField.radio){
      PratamaRadioPresenter presenter = field.presenter as PratamaRadioPresenter;
      return presenter.validate();
    }
    return null;
  }
}