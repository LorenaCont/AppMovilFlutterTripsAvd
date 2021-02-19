import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';


// ignore: must_be_immutable
class ButtoGreen extends StatefulWidget{

  // final tipo constante por ser obligatorio
  final String text;
  double width = 0.0;
  double height = 0.0;

  // comportamiento del boton por parametros requerido
  final VoidCallback onPressed;

  //metodo constructor
  ButtoGreen({Key key, @required this.text, @required this.onPressed, this.height, this.width});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   // throw UnimplementedError();
    return _ButtonGreen();
  }

}

class _ButtonGreen extends State<ButtoGreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(
        top: 30.0,
        left: 30.0,
        right: 30.0,
      ),
      width: widget.width,
      height: widget.height,

      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Center(
          child: SignInButton(
            Buttons.Google,
            onPressed: widget.onPressed,
            text: widget.text,
            ),
        ),
      ),
    );

  }
}