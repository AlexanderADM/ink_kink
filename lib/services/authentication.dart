import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // this one allows you to authenticate anonymously
  Future signInAnon() async {
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return user;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }


  // possibility to sign in with email&password
  // possibility to register with email&password
  // possibility to sign out 
}