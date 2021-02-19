import 'package:flutter/material.dart';

class TitleInputLocation extends StatelessWidget{

  final String hintText;
  final TextEditingController controller;
  final IconData iconData;

  TitleInputLocation ({
    Key key,
    @required this.hintText,
    @required this.controller,
    @required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(right: 20.0, left: 20.0),
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 15.0,
          fontFamily: "Lato",
          color: Colors.blueGrey,
          fontWeight: FontWeight.bold,
        ),
        //decoration TexField
        decoration: InputDecoration(
          hintText: hintText,
          //posicion derecha
          suffixIcon: Icon(iconData),
          fillColor: Color(0xFFFFFFFF),
          //se permite llenar el texto
          filled: true,
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFFFFFF)),
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFFFFFF)),
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
        ),
      ),
      //decoraction de Container
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 15.0,
            //ppsicion de la sobran
            offset: Offset(0.0, 7.0),
          ),
        ],
      ),
    );
  }

}