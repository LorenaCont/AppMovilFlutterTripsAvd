import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Place/ui/widgets/description_place.dart';
import 'package:platzi_trips_app/Place/ui/screens/header_appbar.dart';
import 'package:platzi_trips_app/Place/ui/widgets/review_list.dart';

// ignore: must_be_immutable
class HomeTrips extends StatelessWidget {
  String descriptionDummy = "Ubicada a los pies del Avila, una montaña de 2600 metros, donde se encuentra el parque Ávila o Waraira Repano y el Hotel Humboldt, el cual se llega por un teleférico. Es sin duda una de las mejores atracciones turísticas que tiene la ciudad";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            DescriptionPlace("Caracas", 4, descriptionDummy),
            ReviewList()

          ],
        ),
        HeaderAppBar()
      ],
    );
  }

}