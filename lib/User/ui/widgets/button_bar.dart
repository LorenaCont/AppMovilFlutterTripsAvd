

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'circle_button.dart';
import 'package:platzi_trips_app/Place/ui/screens/add_place_screen.dart';

// ignore: must_be_immutable
class ButtonsBar extends StatelessWidget {
  UserBloc userBloc;
  //ImagePicker imagePicker;
  //File pickedFile;
  //File _imageFile;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    final picker = ImagePicker();
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 0.0,
            vertical: 10.0
        ),
        child: Row(
          children: <Widget>[
           // CircleButton(true, Icons.turned_in_not, 20.0, Color.fromRGBO(255, 255, 255, 1)),
            CircleButton(true, Icons.vpn_key, 20.0, Color.fromRGBO(255, 255, 255, 0.6), () => {}),
            CircleButton(false, Icons.add, 40.0, Color.fromRGBO(255, 255, 255, 1),
                   () async {
              picker.getImage(source: ImageSource.camera).then((PickedFile image) {
                if (image != null)
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) => AddPlaceScreen(image: image))
                  );
              }).catchError((onError) => print("ERROORRRRRRRRR:"  + onError));

            }),
            CircleButton(true, Icons.exit_to_app, 20.0, Color.fromRGBO(255, 255, 255, 0.6), () => {
              userBloc.signOut()
            }),
           // CircleButton(true, Icons.person, 20.0, Color.fromRGBO(255, 255, 255, 0.6))
          ],
        )
    );
  }

}