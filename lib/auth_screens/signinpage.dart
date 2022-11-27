import 'package:authentication_app/auth_screens/registerpage.dart';
import 'package:authentication_app/provider/authentication_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Signinpage extends StatefulWidget {
  const Signinpage({Key? key}) : super(key: key);

  @override
  State<Signinpage> createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){}, 
          icon: Icon(Icons.help_outline_sharp, color: Theme.of(context).textTheme.bodyText1?.color,))
        ],
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon: Icon(Icons.close, color: Theme.of(context).textTheme.bodyText1?.color,))
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: screensize.height*0.85,
              width: screensize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Welcome back!',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),),
                      Text('Sign in to your account', 
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.shade600
                      ),),
                      
                      Form(
                        child: Column(
                          children: [
                            
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  fillColor: Colors.blueGrey.shade100,
                                  filled: true,
                                  border: InputBorder.none
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(Icons.password_outlined),
                                  labelText: 'Password',
                                  fillColor: Colors.blueGrey.shade100,
                                  filled: true,
                                  border: InputBorder.none
                              ),),
                            ),
                          
                          ],
                        )
                        ),
                      SizedBox(
                        height: 40,
                        width: screensize.width,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(onPressed: (){}, 
                          child: const Text('Forgot Password?')),
                        ),
                      ),
                      
                      SizedBox(
                        width: screensize.width,
                        child: Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(screensize.width*0.8, 40),
                              primary: Colors.black
                            ),
                            onPressed: (){
                              Provider.of<AuthNotifier>(context, listen: false).emailsignin(emailController.text, passwordController.text, context);
                            }, 
                            child: const Text('Continue')),
                        ),
                      ),
                      
                      
                          
                    ],
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
                                    builder: (context)=> const Registerpage()));
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}