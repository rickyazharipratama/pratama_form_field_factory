import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:pratama_form_field_factory/buttons/pratama_icon_buttons.dart';
import 'package:pratama_form_field_factory/pickers/pratama_date_time_picker/pratama_date_time_picker_presenter.dart';
import 'package:pratama_form_field_factory/pratama_form_field_factory.dart';
import 'package:pratama_form_field_factory/text_field/pratama_text_field_presenter.dart';

class PratamaDateTimePicker extends StatefulWidget {
  final String label;
  final PratamaDateTimePickerPresenter presenter;
  final Color? primaryColor;
  final EdgeInsets padding;
  final Color? backgroundColor;

  const PratamaDateTimePicker({
    super.key,
    required this.label,
    required this.presenter,
    this.primaryColor,
    this.backgroundColor,
    this.padding = const EdgeInsets.only(top: 10)
  });

  @override
  _PratamaDateTimePickerState createState() => _PratamaDateTimePickerState();
}

class _PratamaDateTimePickerState extends State<PratamaDateTimePicker> {

  late PratamaTextFieldPresenter textPresenter;

  @override
  void initState() {
    super.initState();
    textPresenter = PratamaTextFieldPresenter(
      label: widget.label,
      isReadOnly: true,
      validator: widget.presenter.validator??(_) => "",
      controller: widget.presenter.textController,
      onTap: callModalDatePicker
      
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      child: PratamaTextField(
        presenter: textPresenter
      )
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
                lastDate: widget.presenter.maxDateTime,
                firstDate: widget.presenter.minDateTime,
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
                initDate ??= DateTime.now();
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
          widget.presenter.setSelectedDate(newDate);
        });
      }
  }
}