import 'package:flutter/material.dart';
import 'review.dart';

class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Review("assets/img/LorenaContrerasIcon.jpg", "Lorena Contreras", "1 review · 5 photos", "There is an amazing place in Caracas"),
        Review("assets/img/people2.jpeg", "Marciano P", "5 review · 10 photos", "There is an amazing place in Caracas"),
        Review("assets/img/people3.jpg", "Persona Apellido", "2 review · 7 photos", "There is an amazing place in Caracas"),
      ],
    );
  }

}