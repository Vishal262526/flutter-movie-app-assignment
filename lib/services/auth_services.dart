import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/services/database_services.dart';

class AuthServices {
  static Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential userCred =
          await FirebaseAuth.instance.signInWithCredential(credential);

      await DatabaseServices().initDatabase();

      return userCred;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
