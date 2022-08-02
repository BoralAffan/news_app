import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_api/screens/homeScreen.dart';

class Authscreen extends StatefulWidget {
  const Authscreen({Key? key}) : super(key: key);

  @override
  State<Authscreen> createState() => _AuthscreenState();
}

class _AuthscreenState extends State<Authscreen> {
  void signInGoogle() async {
    final googleSignin = GoogleSignIn();
    final signInAccount = await googleSignin.signIn();
    final googleAccountAuthentication = await signInAccount!.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAccountAuthentication.accessToken,
        idToken: googleAccountAuthentication.idToken);
    await FirebaseAuth.instance.signInWithCredential(credential);

    if (FirebaseAuth.instance.currentUser != null) {
      print('Google Authentication Sucssfull');
      print('${FirebaseAuth.instance.currentUser!.displayName} signed in');
      setState(() {
        isLogin = true;
        name = FirebaseAuth.instance.currentUser!.displayName!;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()
      ));
    } else {
      print('unable to sign in');
    }
  }

  bool isLogin = false;
  late var name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(height: 300, child: Image.asset('assets/login.jpeg')),
            Container(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))),
                  onPressed: () {
                    signInGoogle();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxS5iRASsr50ASJqYsyAvcew2ICajtSGVkJw&usqp=CAU'),
                      SvgPicture.asset('assets/google.svg'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Signin with google',
                        style: TextStyle(fontSize: 25),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
