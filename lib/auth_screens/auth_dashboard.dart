import 'dart:ui';

import 'package:authentication_app/auth_screens/registerpage.dart';
import 'package:authentication_app/auth_screens/signinpage.dart';
import 'package:authentication_app/provider/authentication_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class AuthDashboard extends StatelessWidget {
  const AuthDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.asset('assets/images/authapp_logo.png', fit: BoxFit.contain,)
                  ),
              ),
              
              const SizedBox(
                height: 100,
                width: 300,
                child: Text(
                  'Get your Money Under Control', 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                  ),
              ),
              
              SizedBox(
                height: 100,
                width: 300,
                child: Text(
                  'Manage your expenses. Seemlessly', 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 20
                  ),
                  ),
              ),
              
              const SizedBox(
                height: 30,
                width: 150,            
              ),
              
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  fixedSize: Size(screensize.width*0.8, 40)
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context)=> const Signinpage()));
                },
                child: const Text('Log In with Email')),
              
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(                
                  primary: Theme.of(context).scaffoldBackgroundColor,                
                  side: BorderSide(
                    color: Colors.grey.shade700
                  ),
                  elevation: 0,
                  fixedSize: Size(screensize.width*0.8, 40)
                ),
                onPressed: (){
                  Provider.of<AuthNotifier>(context, listen: false).googlesignin();
                },
                icon: const Icon(Icons.g_mobiledata, color: Colors.grey,),
                label: const Text('Continue With Google', style: TextStyle(color: Colors.black),)),
              
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(                
                  primary: Theme.of(context).scaffoldBackgroundColor,                
                  side: const BorderSide(
                    color: Colors.blue
                  ),
                  elevation: 0,
                  fixedSize: Size(screensize.width*0.8, 40)
                ),
                onPressed: (){
                  Provider.of<AuthNotifier>(context, listen: false).facebooksignin();
                },
                icon: const Icon(Icons.facebook, color: Colors.blue,),
                label: const Text('Continue With Facebook', style: TextStyle(color: Colors.black),)),
              
              const SizedBox(
                height: 20,
              ),
              
              SizedBox(
                height: 80,              
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const Signinpage()));
                      }, 
                      child: const Text(
                        'SignUp', style: 
                        TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          color: Colors.black
                          ),)
                      )
                  ],
                ),
              )
                
                
            ],
          )),
        ),
      ),
    );
  }
}