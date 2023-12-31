import 'package:flutter/material.dart';
import 'package:pratama_form_field_factory/radios/pratama_radio_presenter.dart';

class PratamaRadioListTile extends StatefulWidget {

  final PratamaRadioPresenter presenter;
  final EdgeInsets padding;
  final String label;
  final Color? activeColor;
  const PratamaRadioListTile({
    super.key,
    required this.presenter,
    required this.label,
    this.padding = const EdgeInsets.only(
      top: 10
    ),
    this.activeColor
  });


  @override
  _PratamaRadioListTileState createState() => _PratamaRadioListTileState();
}

class _PratamaRadioListTileState extends State<PratamaRadioListTile> {

  @override
  void initState() {
    super.initState();
    widget.presenter.bridgeValidate = (){
      setState(() {
        widget.presenter.isNeedToShowError = !widget.presenter.isValid;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: widget.padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 5,
              top: 15
            ),
            child: Text(
              widget.label,
              textAlign: TextAlign.left,
              style: TextStyle(color: Theme.of(context).hintColor)
            ),
          ),
    
          Wrap(
            spacing: 10,
            runAlignment: WrapAlignment.spaceEvenly,
            children: widget.presenter.groups.map((item) => 
              RadioListTile(
                value: item.value, 
                groupValue: widget.presenter.selectedValue,
                activeColor: widget.activeColor,
                title: Text(item.title),
                onChanged: (val){
                  setState(() {
                    widget.presenter.onSelectedRadio(val);
                  });
                })
            ).toList(),
          ),
          
          Builder(
            builder: (context){
              if(widget.presenter.isNeedToShowError){
                return Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    widget.presenter.errorText!,
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
}