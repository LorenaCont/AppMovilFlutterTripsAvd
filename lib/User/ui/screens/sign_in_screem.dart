import 'package:flutter/material.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/widgets/gradient_back.dart';
import 'package:platzi_trips_app/widgets/button_green.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:platzi_trips_app/platzi_trips_cupertino.dart';
//import 'package:flutter_login/flutter_login.dart';



class SingInScreem extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignInScreem();
  }

}

class _SignInScreem extends State<SingInScreem> {

  UserBloc userBloc;
  double screenWidht;


  @override
  Widget build(BuildContext context) {

   // double screenWidht = MediaQuery.of(context).size.width;
    //instancias objeto userBloc
    userBloc = BlocProvider.of(context);

    return _handleCurrentSession();
  }


  Widget _handleCurrentSession(){
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //snapshot contiene el objeto User
        if (snapshot.hasData) {
          return PlatziTripsCupertino();
        } else if (snapshot.hasError) {
          return Text("Ocurrio un error");
        } else if(snapshot.connectionState != ConnectionState.waiting) {
          return signInGoogleUI();
        }else{
          return Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 20,
                      width: 70,
                      child: CircularProgressIndicator(backgroundColor: Colors.cyan[400], )
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text("C a r g a n d o", style: TextStyle(color: Colors.blue[400], fontSize: 22, fontFamily: "Lato", decoration: TextDecoration.none)
                    ),)
                ]
            ),
          );
        }
      },
    );
  }

  Widget signInGoogleUI(){
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          //null full screem
          GradientBack(height: null),
          Column(
            //centrar Verticalmente
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Flexible(
                child: Container(
                  width: screenWidht,
                  child: Text("Bienvenido \nEste es un App de Viaje\nLogin",
                    style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: "Lato",
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),

              ButtoGreen(text: "Sign in with Gmail",
                  onPressed: () {
                    userBloc.signOut();
                    userBloc.signIn().then((auth.User user) {
                      userBloc.updateUserData(User(
                        uid: user.uid,
                        name: user.displayName,
                        email: user.email,
                        photoURL: user.photoURL
                      ));
                    });
                  },
                width: 250.0,
                height: 50.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
