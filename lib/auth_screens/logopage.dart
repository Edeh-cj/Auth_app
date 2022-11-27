import 'package:authentication_app/auth_screens/profilepage.dart';
import 'package:flutter/material.dart';

class Logopage extends StatelessWidget {
  const Logopage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: logodelay(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done || snapshot.connectionState == ConnectionState.none){
          return const Profilepage();
        } else {
          return const Scaffold(
          body: Center(
            child: SizedBox(
              height: 200,
              width: 200,
              child: Image(
                image: AssetImage('assets/images/authapp_logo.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
        }
      }
    );
  }
}

logodelay(){
  Future.delayed(const Duration(seconds: 3), (){
    return '_future_';
  });
}