import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';


class AuthNotifier extends ChangeNotifier{
  final auth = FirebaseAuth.instance;
  final store = FirebaseStorage.instance.ref();
  final ImagePicker picker = ImagePicker();
  User? user;
  

  emailregister(String email, String password, context) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(email: email, password: password);
      user = credential.user;
      if(credential.user != null){Navigator.pop(context);}
      log(auth.currentUser!.uid); 
    } on FirebaseAuthException catch (e){
      log(e.code);
    }
  }

  emailsignin(String email, String password, BuildContext context) async{
    try{
      UserCredential credential = await auth.signInWithEmailAndPassword(email: email, password: password);
      user = credential.user;
      if(credential.user != null){Navigator.pop(context);}
      notifyListeners();
    } on FirebaseAuthException catch (e){
      log(e.code);
    }
  }

  googlesignin() async{
    GoogleSignInAccount? googleaccount = await GoogleSignIn().signIn();
    if (googleaccount != null){
      GoogleSignInAuthentication googleauthentication = await googleaccount.authentication;
      AuthCredential googlecredential = GoogleAuthProvider.credential(
        accessToken: googleauthentication.accessToken,
        idToken: googleauthentication.idToken
      );
      UserCredential credential = await auth.signInWithCredential(googlecredential);
      user = credential.user;
      notifyListeners();
    }
  }
  

  facebooksignin() async{
    LoginResult fbloginresult = await FacebookAuth.instance.login();
    OAuthCredential fbcredential = FacebookAuthProvider.credential(fbloginresult.accessToken!.token);
    UserCredential credential = await auth.signInWithCredential(fbcredential);
    user = credential.user;
    notifyListeners(); 
    
  }

  logout(){
    auth.signOut();
  }

  uploadphoto() async{
    

  XFile? pickedfile = await picker.pickImage(source: ImageSource.camera);
  final picshead = store.child("profile pics/${user?.uid}");

  if(pickedfile != null){
    File file = File(pickedfile.path);        
    picshead.putFile(file);
  }
  try {
  final String photourl = await picshead.getDownloadURL();
  auth.currentUser!.updatePhotoURL(photourl);     
} on Exception catch (e) {
  log(e.toString());
  throw('something went wrong');
}

  notifyListeners();

  }
}