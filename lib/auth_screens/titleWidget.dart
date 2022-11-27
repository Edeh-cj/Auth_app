import 'package:flutter/material.dart';


Widget titlewidget(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: const [
      SizedBox(
        height: 50,
        width: 50,
        child: Image(
          fit: BoxFit.contain,
          image: AssetImage('assets/images/authapp_logo.png'))
          ),
          Text('AUTHAPP', style: TextStyle(color: Colors.black),)
    ],
  );
}

          
          
          
            
              
              
              
                
                
                

            
          
        