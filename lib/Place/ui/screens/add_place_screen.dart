


import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/Place/ui/widgets/card_image.dart';
import 'package:platzi_trips_app/Place/ui/widgets/title_input_location.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/widgets/button_purple.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';
import 'package:platzi_trips_app/widgets/text_imput.dart';
import 'package:platzi_trips_app/widgets/title_header.dart';


// ignore: must_be_immutable
class AddPlaceScreen extends StatefulWidget{

  PickedFile image;
  bool camera = false;


  AddPlaceScreen({
    Key key,
    this.image,
    this.camera,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddPlaceScreen();
  }

}

class _AddPlaceScreen extends State<AddPlaceScreen>{

  final _controllerTitlePlace = TextEditingController();
  final _controllerDescription = TextEditingController();
  final _controllerLocation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
   // File _imageFile;


   return Scaffold(
     body: Stack(
       children: <Widget>[
         GradientBack(height: 300.0,),
         Row(
           children: <Widget>[
             Container(
               padding: EdgeInsets.only(top: 25.0, left: 5.0),
               child: SizedBox(
                 height: 45.0,
                 width: 45.0,
                 child: IconButton(
                   icon: Icon(Icons.keyboard_arrow_left, color: Colors.white, size: 45.0),
                   onPressed: (){
                     Navigator.pop(context);
                   },
                 ),
               ),
             ),
             Flexible(
               child: Container(
                 padding: EdgeInsets.only(top:45.0, left: 20.0, right: 10.0),
                 child: TitleHeader(title: "Agregar nuevo lugar"),
               ),
             ),
           ],
         ),
         Container(
           margin: EdgeInsets.only(top: 120.0, bottom: 20.0),
           child: ListView(
             children: <Widget>[
               //Este container tiene la foto
               Container(
                 alignment: Alignment.center,
                 child: CardImageWithFabIcon(
                   pathImage: widget.image.path, //"assets/img/caracas.jpeg"
                   iconData: Icons.camera_alt,
                   width: MediaQuery.of(context).size.width * 0.90,
                   height: 250.0,
                   left: 0.0,
                   image: widget.image,
                   camera: widget.camera,
                   onPressedFabIcon: (){},
                 ),
               ),
               // text Field de titulo de la foto
               Container(
                 margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                 child: TextImput(
                   hintText: "Titulo Foto",
                   inputType: null,
                   maxLines: 1,
                   controller: _controllerTitlePlace,
                 ),
               ),
               TextImput(
                   hintText: "Descripción del Lugar",
                   inputType: TextInputType.multiline,
                   maxLines: 4,
                   controller: _controllerDescription,
               ),
               Container(
                 margin: EdgeInsets.only(top: 20.0),
                 child: TitleInputLocation(
                   hintText: "Agregar Locacion",
                   iconData: Icons.location_on,
                   controller: _controllerLocation,
                 ),
               ),
               Container(
                 width: 70.0,
                 child: ButtonPurple(
                   buttonText: "Agregar Lugar",
                   onPressed: (){
                     //Firebase Storage (subir imagen)
                     // url imagen
                     //ID del usuario logeado actual
                     userBloc.currentInfoUser().then((auth.User user) {
                       if (user != null){
                         String uid = user.uid;
                         String path = "$uid/${DateTime.now().toString()}.jpg";
                         //Firebase Storage
                         userBloc.uploadFile(path, widget.image)
                         //se recupera la url de la imagen que subio
                             .then((StorageUploadTask storageUploadTask){
                               storageUploadTask.onComplete.then((StorageTaskSnapshot snapshot) {
                                 snapshot.ref.getDownloadURL().then((urlImage) {
                                   print("URI Imagen: $urlImage");

                                   //Cloud Firestore
                                   //Place  tittle, descripcion, url, userOwner, likes
                                  // File img = File(widget.image.path);
                                   userBloc.updatePlaceData(Place(
                                     name: _controllerTitlePlace.text,
                                     description: _controllerDescription.text,
                                     urlImage: urlImage,
                                     likes: 0,
                                   )).whenComplete((){
                                     print("Termino");
                                     Navigator.pop(context);
                                   });


                                 });
                               });

                         });
                       }
                     });

                   },
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