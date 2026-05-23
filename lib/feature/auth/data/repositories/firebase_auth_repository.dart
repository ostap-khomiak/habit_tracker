import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Google Sign-in is only available on Android, iOS, macOS and Web.
  // firebase_auth on Windows doesn't support Google as a provider via google_sign_in.
  static bool get isSignInSupported =>
      kIsWeb ||
      defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.macOS;

  Stream<User?> authStateChanges() => _auth.authStateChanges();

  Future<void> signInWithGoogle() async {
    if (!isSignInSupported) {
      throw UnsupportedError('Google Sign-in is not supported on this platform');
    }
    final googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return; // user cancelled
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await _auth.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    if (isSignInSupported) {
      await GoogleSignIn().signOut();
    }
    await _auth.signOut();
  }
}
