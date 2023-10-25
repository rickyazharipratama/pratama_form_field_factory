import 'package:flutter/material.dart';
import 'package:pratama_form_field_factory/text_field/pratama_text_field_presenter.dart';

class PratamaTextField extends StatefulWidget {
  final EdgeInsets padding;
  final PratamaTextFieldPresenter presenter;

  const PratamaTextField({
    super.key,
    this.padding = const EdgeInsets.only(top: 10),
    required this.presenter
  });
  
  @override
  PratamaTextFieldState createState() => PratamaTextFieldState();
}

class PratamaTextFieldState extends State<PratamaTextField> {

  @override
  void initState() {
    super.initState();
    widget.presenter.onExtendValidation = validate;
  }


  @override
  Widget build(BuildContext context) {
    print("building ${widget.presenter.label}");
    return Padding(
      padding: widget.padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            // key: presenter.key,
            onEditingComplete: widget.presenter.onEditingComplete,
            readOnly: widget.presenter.isReadOnly,
            keyboardType: widget.presenter.keyboardType,
            enabled: widget.presenter.isEnabled,
            onChanged: (val){
              if(widget.presenter.isNeedToShowError){
                setState(() {
                  widget.presenter.isNeedToShowError = false;
                  widget.presenter.onChange?.call(val);
                });
              }else{
                widget.presenter.onChange?.call(val);
              }
            },
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
              labelText: widget.presenter.label,
            ),
            obscureText: widget.presenter.maxLine > 1 ? false : widget.presenter.isObscured,
            controller: widget.presenter.textController,
            maxLines: widget.presenter.maxLine,
            onTap: widget.presenter.onTap,
            focusNode: widget.presenter.textNode,
            onSubmitted: (val){
              widget.presenter.textController.value = TextEditingValue(
                text: val
              );
            },

          ),
          Builder(
            builder: (context){
              if(widget.presenter.isNeedToShowError){
                return Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    widget.presenter.errorMessage!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error
                    ),
                  ),
                );
              }
              return Container();
            }
          )
        ],
      ),
    );
  }

  void validate(){
    setState(() {
      widget.presenter.isNeedToShowError = !widget.presenter.isValid;
    });
  }

  @override
  void dispose() {
    widget.presenter.textNode.dispose();
    super.dispose();
  }
}