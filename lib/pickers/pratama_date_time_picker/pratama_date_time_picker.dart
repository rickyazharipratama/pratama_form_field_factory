import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:pratama_form_field_factory/buttons/pratama_icon_buttons.dart';
import 'package:pratama_form_field_factory/pickers/pratama_date_time_picker/pratama_date_time_picker_presenter.dart';

class PratamaDateTimePicker extends StatefulWidget {
  final DateTime? currentDate;
  final String label;
  final PratamaDateTimePickerPresenter presenter;
  final String? validation;
  final Color? primaryColor;
  final Color? backgroundColor;

  const PratamaDateTimePicker({
    super.key,
    this.currentDate,
    required this.label,
    required this.presenter,
    this.validation,
    this.primaryColor,
    this.backgroundColor
  });

  @override
  _PratamaDateTimePickerState createState() => _PratamaDateTimePickerState();
}

class _PratamaDateTimePickerState extends State<PratamaDateTimePicker> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        labelText: widget.label 
      ),
      initialValue: widget.presenter.getFormattedDate()??"",
      validator: widget.presenter.validator??(_) => "",
      onTap: callModalDatePicker,
    );
  }

  callModalDatePicker() async{
    DateTime? initDate = widget.presenter.selectedDate;
    DateTime? newDate = await showModalBottomSheet(
      context: context,
      builder: (context){
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                10,5,0,5
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.label,
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 18
                      ),
                    ),
                  ),
                  PratamaIconButton(
                    icon: Icons.close,
                    onTap: Navigator.of(context).pop,
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: DatePickerWidget(
                dateFormat: "dd-MMMM-yyyy",
                locale: DateTimePickerLocale.id,
                pickerTheme: DateTimePickerTheme(
                  backgroundColor: widget.backgroundColor??Colors.transparent,
                  dividerColor: widget.primaryColor ?? const Color.fromARGB(255, 204, 110, 200)
                ),
                initialDate: initDate,
                onChange: (changed, _){
                  initDate = changed;
                },
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).pop(initDate);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 70 + MediaQuery.of(context).padding.bottom,
                color: widget.primaryColor??const Color.fromARGB(255, 204, 110, 200),
                child: Center(
                  child: Text(widget.presenter.getButtonSelectedTitle(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffffffff)
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      });
      if(newDate!= null){
        setState(() {
          widget.presenter.selectedDate = newDate;
        });
      }
  }
}