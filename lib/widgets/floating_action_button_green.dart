import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {

  final IconData iconData;
  final VoidCallback onPressed;

  FloatingActionButtonGreen({
   Key key,
   @required this.iconData,
   @required this.onPressed,
});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FloatingActionButtonGreen();
  }

}


class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen> {
  bool _isFavorited = false;

  /*void onPressedFav(){
    setState(() {

      if (_isFavorited) {
        _isFavorited = false;
        Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text("Quitaste de tus favoritos"),
            )
        );
      } else {
        _isFavorited = true;
        Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text("Agregastes a tus favoritos"),
            )
        );
      }
    });

  } */

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      backgroundColor: Color(0xFF11DA53),
      mini: true,
      tooltip: "Fav",
      onPressed: widget.onPressed,
      child: Icon(
        widget.iconData,
      ),
     /* child: Icon(
          _isFavorited ? Icons.favorite : Icons.favorite_border
      ), */
      heroTag: null,
    );
  }

}