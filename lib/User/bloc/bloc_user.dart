import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platzi_trips_app/Place/model/place.dart';
import 'package:platzi_trips_app/Place/repository/firebase_storage_repository.dart';
import 'package:platzi_trips_app/User/model/user.dart';
import 'package:platzi_trips_app/User/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:platzi_trips_app/User/repository/cloud_firestore_api.dart';
import 'package:platzi_trips_app/User/repository/cloud_firestore_respository.dart';
import 'package:platzi_trips_app/User/ui/widgets/profile_place.dart';



class UserBloc implements Bloc{

  final _auth_repository = AuthRepository();

  //flujo de datos - streams
  //Streams de Firebase trae su propio metodo de stremas
  //ScreamControlleer Si no usa Firebase

  Stream<auth.User> streamFirebase = auth.FirebaseAuth.instance.authStateChanges();
  Stream<auth.User> get authStatus => streamFirebase;
  Future<auth.User> currentInfoUser() async{
    return auth.FirebaseAuth.instance.currentUser;
  }

  //casos de uso
  //Sing in a la app con google
  Future<auth.User> signIn(){
    return _auth_repository.signInFirebase();
  }

  //caso de uso registrar usuario en base de datos

  final _cloudFirestoreRepository = CloudFirestoresRepository();
  void updateUserData(User user) => _cloudFirestoreRepository.updateUserDataFirestore(user);
  Future<void> updatePlaceData(Place place) => _cloudFirestoreRepository.updatePlaceData(place);

  Stream<QuerySnapshot> placesListStream = FirebaseFirestore.instance.collection(CloudFirestoreAPI().PLACES).snapshots();
  Stream<QuerySnapshot> get placesStream => placesListStream;

  //List<CardImageWithFabIcon> buildPlaces(List<DocumentSnapshot> placesListSnapshot) => _cloudFirestoreRepository.buildPlaces(placesListSnapshot);
  List<Place> buildPlaces(List<DocumentSnapshot> placesListSnapshot, User user) => _cloudFirestoreRepository.buildPlaces(placesListSnapshot, user);
  Future likePlace(Place place, String uid) => _cloudFirestoreRepository.likePlace(place,uid);

  Stream<QuerySnapshot> myPlacesListStream(String uid) => FirebaseFirestore.instance.collection(CloudFirestoreAPI().PLACES)
      .where("userOwner", isEqualTo: FirebaseFirestore.instance.doc("${CloudFirestoreAPI().USERS}/$uid"))
      .snapshots();
  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placeListSnapshot) => _cloudFirestoreRepository.buildMyPlaces(placeListSnapshot);



  final _firebaseStorageRespository = FirebaseStorageRepository();
  Future<StorageUploadTask> uploadFile(String path, PickedFile image) => _firebaseStorageRespository.uploadFile(path, image);


  StreamController<Place> placeSelectedStreamController =  StreamController<Place>();
  Stream<Place> get placeSelectedStream => placeSelectedStreamController.stream;
  StreamSink<Place> get placeSelectedSink =>  placeSelectedStreamController.sink;

  //Caso de uso Sign Out
  signOut(){
    _auth_repository.signOut();
  }


  @override
  void dispose() {
    // TODO: implement dispose
  }

}