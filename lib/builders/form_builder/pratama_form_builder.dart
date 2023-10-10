import 'package:flutter/material.dart';
import 'package:pratama_form_field_factory/Utils/pratama_Constants.dart';
import 'package:pratama_form_field_factory/builders/form_builder/pratama_form_builder_model.dart';
import 'package:pratama_form_field_factory/builders/form_builder/pratama_form_custom_field.dart';
import 'package:pratama_form_field_factory/pickers/pratama_date_time_picker/pratama_date_time_picker.dart';
import 'package:pratama_form_field_factory/radios/pratama_radio.dart';
import 'package:pratama_form_field_factory/text_field/pratama_text_field.dart';




class PratamaFormBuilder extends StatelessWidget {

  final List<PratamaFormBuilderModel> fields;
  final List<PratamaFormCustomField>? customField;
  final Widget? submitButton;
  final GlobalKey<FormState> formKey;

  const PratamaFormBuilder({
    super.key,
    required this.formKey,
    required this.fields,
    this.customField,
    this.submitButton
  });


  @override
  Widget build(BuildContext context) {
    if(customField != null){
      if(customField!.isNotEmpty){
        customField!.sort((a,b)=> a.topOf.compareTo(b.topOf));
        int modifier = 0;
        for (var item in customField!) {
          PratamaFormBuilderModel custom = PratamaFormBuilderModel(
            field: PratamaFormField.customField, 
            linkCustomIndex: customField!.indexOf(item)
          );
          if((item.topOf+modifier) >= fields.length){
            fields.add(custom);
          }else{
            fields.insert(item.topOf+modifier, custom);
          }
          modifier++;
        }
      }
    }
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  fields.map((item){
              return getWidgetField(field: item);
            }).toList(),
          ),
        ),
      )
    );
  }

  Widget getWidgetField({required PratamaFormBuilderModel field}){

    Widget? fieldWidget;
    switch (field.field) {
      case PratamaFormField.textField:
          fieldWidget = PratamaTextField(
            presenter: field.presenter
          );
         break;
      
      case PratamaFormField.radio:
          fieldWidget = PratamaRadio(presenter: field.presenter);
          break;
      
      case PratamaFormField.dateTIemPicker:
          fieldWidget = PratamaDateTimePicker( presenter: field.presenter);
          break;
      
      case PratamaFormField.customField:
          fieldWidget = customField!.elementAt(field.linkCustomIndex!).field;
          break;
      default: fieldWidget = Container();
    }
    return fieldWidget;

  }
}