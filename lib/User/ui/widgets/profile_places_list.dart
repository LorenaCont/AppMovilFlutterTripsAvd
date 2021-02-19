import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/model/user.dart';



// ignore: must_be_immutable
class ProfilePlacesList extends StatelessWidget {

  UserBloc userBloc;
  User user;
  ProfilePlacesList(@required this.user);

 /* Place place = new Place(
      name: 'Caracas',
      description: 'Parque Nacional del Avila',
      urlImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSKfbRfuW7_TF0S0Mkz0FC8tqffT54oraZiHA&usqp=CAU",
      likes: 3
  );

  Place place2 = new Place(
      name: 'Lara',
      description: 'Barquisimeto Flor de Venezuela',
      urlImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSjWIo2oPGYGJTJgIiVTW9POy5Cixlg3gyIRQ&usqp=CAU",
      likes: 10
  );

  Place place3 = new Place(
      name: 'Los Roques',
      description: 'Cayo de Agua, Archipielago de Los Roques',
      urlImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQUJsvwhwNFQClrrgR1FFHKT28L38d6xLIMnw&usqp=CAU",
      likes: 15
  );

  Place place4 = new Place(
      name: 'Salto Angel',
      description: 'Cascada de agua más alta del mundo, con una altura de 979 m, ​​​originada en el Auyantepuy',
      urlImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTAKaR12aaWjcKr9lYBEOsELwutAifczrk0fQ&usqp=CAU",
      likes: 15
  );
  */


  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    return Container(
      margin: EdgeInsets.only(
          top: 10.0,
          left: 20.0,
          right: 20.0,
          bottom: 10.0
      ),
      child: StreamBuilder(
        stream: userBloc.myPlacesListStream(user.uid),
        // ignore: missing_return
        builder: (context, AsyncSnapshot snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              case ConnectionState.done:
                return Column(
                  // ignore: missing_return, missing_return
                    children: userBloc.buildMyPlaces(snapshot.data.documents)
                );
              case ConnectionState.active:
                return Column(
                  // ignore: missing_return, missing_return
                    children: userBloc.buildMyPlaces(snapshot.data.documents)
                );
              case ConnectionState.none:
                return CircularProgressIndicator();
              default:
                return Column(
                  // ignore: missing_return, missing_return
                    children: userBloc.buildMyPlaces(snapshot.data.documents)
                );


            }


        }
      ),
    );
  }


  /*
  Column(
        children: <Widget>[
          ProfilePlace(place),
          ProfilePlace(place2),
          ProfilePlace(place3),
          ProfilePlace(place4),
        ],
      ),
   */

}