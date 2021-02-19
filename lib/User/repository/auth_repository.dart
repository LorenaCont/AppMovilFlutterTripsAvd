import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:platzi_trips_app/User/repository/firebaseAuth_api.dart';

//Logica de negocio
class AuthRepository {
  final _firebaseAuthAPI = FirebaseAuthAPI();

  Future<auth.User> signInFirebase() => _firebaseAuthAPI.signIn();

  signOut() => _firebaseAuthAPI.signOut();

}