import 'package:pratama_form_field_factory/radios/models/pratama_radio_model.dart';

class PratamaRadioListTilePresenter<T>{

  final List<PratamaRadioModel> groups;
  T? selectedValue;
  PratamaRadioListTilePresenter({required this.groups, this.selectedValue});


  onSelectedRadio(T val){
    selectedValue = val;
  }
}