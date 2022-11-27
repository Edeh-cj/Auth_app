import 'package:authentication_app/auth_screens/auth_dashboard.dart';
import 'package:authentication_app/auth_screens/logopage.dart';
import 'package:authentication_app/auth_screens/profilepage.dart';
import 'package:authentication_app/auth_screens/signinpage.dart';
import 'package:authentication_app/provider/authentication_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto'
      ),
      home: StreamBuilder(
        stream: Provider.of<AuthNotifier>(context).auth.authStateChanges(),        
        builder: (context, snapshot){
          if(snapshot.data == null){
            
            return const AuthDashboard();
          }else {
            
            return const Logopage();
          }
        },)
    );
  }
}