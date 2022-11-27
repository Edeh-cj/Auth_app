import 'package:authentication_app/provider/authentication_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({Key? key}) : super(key: key);

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leadingWidth: screensize.width*0.5,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(Icons.arrow_back, color: Colors.black,),
                Text(' Back', style: TextStyle(color: Colors.black, fontSize: 19),),
              ],
            ),
          ),
        ),
        
      ),
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      'Sign Up', 
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),),
                  ),
                ],
              ),
              Text(
                'Create an account so you can do more even faster',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 18
                ),
                ),
              
              Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:15.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          fillColor: Colors.blueGrey.shade100,
                          filled: true,
                          border: InputBorder.none
                        ),
                    ),
                      ),
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
                        ),
                    ),
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          'Your password must be 8 or more characters long & contain a mix of upper & lower case letters, numbers & symbols.',
                          style: TextStyle(
                            color: Colors.grey.shade700
                          ),
                          ),
                      )
                    ],
                  ),
                )
                ),
              
              SizedBox(
                height: 60,
                width: screensize.width,
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(screensize.width*0.8, 40),
                      primary: Colors.black
                    ),
                    onPressed: (){
                      Provider.of<AuthNotifier>(context, listen: false).emailregister(emailController.text, passwordController.text, context);
                    }, 
                    child: const Text('Create an account')),
                ),
              ),

              const SizedBox(
                height: 30,
              ),
              
              SizedBox(
                height: 40,
                width: screensize.width*0.65,
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: 'By signing up, you agree to our ',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18
                      ),
                      children: [
                        TextSpan(
                          text: 'Terms Of Use',
                          style: TextStyle(
                        color: Colors.black,
                        fontSize: 18
                      ),
                        ),
                        TextSpan(
                          text: ' and ',
                          style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18
                      ),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                        color: Colors.black,
                        fontSize: 18
                      ),
                        )
                      ]
                    )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}