import 'package:flutter/material.dart';
import 'package:pratama_form_field_factory/text_field/pratama_text_field_presenter.dart';

class PratamaTextField extends StatelessWidget {
  final EdgeInsets? padding;
  final PratamaTextFieldPresenter presenter;
  const PratamaTextField({
    super.key,
    this.padding = const EdgeInsets.only(top: 10),
    required this.presenter,
  });




  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: TextFormField(
        readOnly: presenter.isReadOnly,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: presenter.keyboardType,
      
        decoration: InputDecoration(
          labelText: presenter.label,
        ),
        controller: presenter.textController,
        validator: presenter.validator,
        maxLines: presenter.maxLine,
        onTap: presenter.onTap,
      ),
    );
  }
}