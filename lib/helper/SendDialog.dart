import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:payme/helper/ConfirmDialog.dart';

import 'Consts.dart';
TextEditingController valueController = new TextEditingController();
TextEditingController mensageController = new TextEditingController();

 var maskTextInputFormatter = MaskTextInputFormatter(mask: "###.###.###-##", filter: { "#": RegExp(r'[0-9]') });

class SendDialog extends StatelessWidget {
  final String title, value, buttonText, reciver;
  final Image image;
  

  SendDialog({
    @required this.title,
    this.value,
    @required this.reciver,
    @required this.buttonText,
    this.image,
  });


  @override
  Widget build(BuildContext context) {
    return Dialog(
      
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 100.0,
              bottom: Consts.padding,
              left: Consts.padding,
              right: Consts.padding,
            ),
            margin: EdgeInsets.only(top: Consts.avatarRadius),
            decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(Consts.padding),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: const Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // To make the card compact
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 16.0),

                TextFormField(
                  controller: valueController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  autofocus: false,
                  inputFormatters: [maskTextInputFormatter],
                  decoration: InputDecoration(
                      hintText: 'Valor',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0))),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: mensageController,
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  decoration: InputDecoration(
                      hintText: 'Mensagem',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 40.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0))),
                ),
                

                // Text(
                //   value,
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //     fontSize: 16.0,
                //   ),
                // ),
                SizedBox(height: 24.0),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      var value = valueController.text;
                      String message  = mensageController.text;
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => CustomDialog(
                          title: 'Confirmar',
                          description: 'Enviar $value para $reciver Mensagem: \n $message ',
                          buttonText: "Confirmar",
                        ),
                      );
                      valueController.clear();
                      mensageController.clear();
                    },
                    child: Text(buttonText),
                  ),
                ),
              ],
            ),
          ),
    
        ],
      ),
    );
  }
}
