import 'package:authentication_app/auth_screens/titleWidget.dart';
import 'package:authentication_app/provider/authentication_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: titlewidget()
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              backgroundImage: NetworkImage(Provider.of<AuthNotifier>(context).auth.currentUser?.photoURL ?? 
              'https://firebasestorage.googleapis.com/v0/b/fir-1-1d7ec.appspot.com/o/no-photoimage.png?alt=media&token=ffd13f10-41e1-4ec5-9877-673842c4709b'),
             
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(Provider.of<AuthNotifier>(context).auth.currentUser?.email ?? 'no user logged in'),
            ),
            const SizedBox(height: 200),

            ElevatedButton.icon(
              onPressed: (){
                Provider.of<AuthNotifier>(context, listen: false).uploadphoto();
              }, 
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).textTheme.bodyText1?.color
              ),
              icon: const Icon(Icons.camera_alt), 
              label: const Text('Upload Photo')
            ),

            const SizedBox(
              height: 30,
            ),

            ElevatedButton.icon(
              onPressed: (){
                Provider.of<AuthNotifier>(context, listen: false).logout();
              }, 
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).textTheme.bodyText1?.color
              ),
              icon: const Icon(Icons.logout_rounded), 
              label: const Text('Sign Out')
            )
          ],
        ),
      ),
    );
  }
}