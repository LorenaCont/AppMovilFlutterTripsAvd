import 'package:flutter/material.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import '../widgets/user_info.dart';
import '../widgets/button_bar.dart';

// ignore: must_be_immutable
class ProfileHeader extends StatelessWidget {
 // UserBloc userBloc;
  User user;
  ProfileHeader(@required this.user);

  @override
  Widget build(BuildContext context) {

    final title = Text(
      "Perfil",
      style: TextStyle(
        fontFamily: "Lato",
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 30.0,
      ),
    );

    return Container(
      margin: EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 50.0
      ),
      child: Column(
        children: [
          Row(
            children: [
              title
            ],
          ),
          UserInfo(user),
          ButtonsBar()
        ],
      ),
    );
   // userBloc = BlocProvider.of<UserBloc>(context);

/*
    return StreamBuilder(
      stream: userBloc.streamFirebase,
      // ignore: missing_return
      builder: (BuildContext context, AsyncSnapshot snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.none:
            return CircularProgressIndicator();
          case ConnectionState.active:
            return showProfileData(snapshot);
          case ConnectionState.done:
            return showProfileData(snapshot);
        }
      },
    );
    */

  }

  Widget showProfileData(AsyncSnapshot snapshot){
    if(!snapshot.hasData || snapshot.hasError){
      print("No logeado");
      return Container(
          margin: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 50.0
      ),
        child: Column(
          children: <Widget>[
            CircularProgressIndicator(),
            Text ("No se pudo cargar la información. Haz login"),
            ],
        ),

      );
    }else {
      print ("Logeado");
      print (snapshot.data);
      user = User(name: snapshot.data.displayName, email: snapshot.data.email, photoURL: snapshot.data.photoUrl);
      final title = Text(
        'Profile',
        style: TextStyle(
            fontFamily: 'Lato',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0
        ),
      );

      return Container(
        margin: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 50.0
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                title
              ],
            ),
           // UserInfo("assets/img/LorenaContrerasIcon.jpg", "Lorena Contreras", "maillorena@gmail.com"),
            UserInfo(user),
            ButtonsBar(),
          ],
        ),
      );
    }
  }

}