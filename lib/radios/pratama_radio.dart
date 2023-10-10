import 'package:flutter/material.dart';
import 'package:pratama_form_field_factory/radios/pratama_radio_presenter.dart';

class PratamaRadio extends StatefulWidget {

  final PratamaRadioPresenter presenter;
  final EdgeInsets padding;
  final Color? activeColor;

  const PratamaRadio({
    super.key,
    required this.presenter,
    this.padding = const EdgeInsets.only(
      top: 10
    ),
    this.activeColor
  });

  @override
  // ignore: library_private_types_in_public_api
  _PratamaRadioState createState() => _PratamaRadioState();
}

class _PratamaRadioState extends State<PratamaRadio> {


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
    return Container(
      padding: widget.padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          
          Builder(
            builder: (context) {
              if(widget.presenter.label != null){
                return Padding(
                  padding: const EdgeInsets.only(
                    top: 15
                  ),
                  child: Text(
                    widget.presenter.label!,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Theme.of(context).hintColor)
                  ),
                );
              }
              return Container();
            }
          ),

          Wrap(
            spacing: 5,
            children: widget.presenter.groups.map((item) => 
              InkWell(
                onTap: () {
                  setState(() {
                    widget.presenter.onSelectedRadio(item.value);
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Radio(
                        value: item.value, 
                        groupValue: widget.presenter.selectedValue, 
                        onChanged: (val){
                          setState(() {
                            widget.presenter.onSelectedRadio(val);
                          });
                        }
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          item.title
                        ),
                      )
                    ],
                  ),
                ),
              )
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
        ]
      )
    );
  }
}