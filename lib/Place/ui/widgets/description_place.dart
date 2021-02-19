import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import '../../../widgets/button_purple.dart';

// ignore: must_be_immutable
class DescriptionPlace extends StatelessWidget {

  String namePlace;
  int stars;
  String descriptionPlace;

  DescriptionPlace(this.namePlace, this.stars, this.descriptionPlace);



  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    final starHalf = Container (
      margin: EdgeInsets.only(
          top: 353.0,
          right: 3.0
      ),

      child: Icon(
        Icons.star_half,
        color:  Color(0xFFf2C611),
      ),
    );

    final starBorder = Container (
      margin: EdgeInsets.only(
          top: 353.0,
          right: 3.0
      ),

      child: Icon(
        Icons.star_border,
        color:  Color(0xFFf2C611),
      ),
    );

    final star = Container (
      margin: EdgeInsets.only(
        top: 353.0,
        right: 3.0
      ),

      child: Icon(
        Icons.star,
        color:  Color(0xFFf2C611),
      ),
    );

   return StreamBuilder<Place>(
     stream: userBloc.placeSelectedStream,
     builder: (BuildContext context, AsyncSnapshot<Place> snapshot){
       if(snapshot.hasData){
         print("PLACE SELECTED: ${snapshot.data.name}");
         Place place = snapshot.data;
         return Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             titleStars(place),
             likesHearts(place.likes),
             descriptionWidget(place.description),
             ButtonPurple(buttonText: "Navegar", onPressed: (){},)
           ],
         );
       } else {
         return Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Container(
               margin: EdgeInsets.only(
                 top: 400.0,
                 left: 30.0,
                 right: 20.0
               ),
               child: Text(
                 "Seleccione un Lugar para ver su información",
                 style: TextStyle(
                   fontFamily: "Lato",
                   fontSize: 30.0,
                   fontWeight: FontWeight.w900
                 ),
                 textAlign: TextAlign.left,
               ),
             )
           ],
         );
       }
     },
   );

  }

  Widget titleStars(Place place){
    return Column (
      children: [
        Container (
          margin: EdgeInsets.only(
              top: 350.0,
              left: 30.0,
              right: 20.0
          ),

          child: Text(
            place.name,
            style: TextStyle(
                fontFamily: "Lato",
                fontSize: 30.0,
                fontWeight: FontWeight.w900
            ),
            textAlign: TextAlign.left,
          ),
        ),
       /* Row(
          children: <Widget>[
            star,
            star,
            star,
            star,
            starHalf
          ],
        )*/
       ],
    );
  }



  Widget likesHearts(int hearts){
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
              top: 20.0,
              left: 30.0,
              right: 20.0
          ),
          child: Text(
            //"Hearts: ${place.likes}",
            "Hearts: ${hearts}",
            style: TextStyle(
                fontFamily: "Lato",
                fontSize: 18.0,
                fontWeight: FontWeight.w900,
                color: Colors.amber
            ),
                //  textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  Widget descriptionWidget(String descriptionPlace){
    return Container(
      margin: EdgeInsets.only(
          top: 20.0,
          left: 30.0,
          right: 20.0

      ),
      child: Text(
        descriptionPlace,
        style: const TextStyle(
            fontFamily: "Lato",
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF56575a)
        ),

      ),
    );
  }

}