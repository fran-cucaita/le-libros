import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:le_libros/app/domain/inputs/sign_up.dart';
import 'package:le_libros/app/domain/repositories/signup_repository.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final FirebaseAuth _auth;

  SignUpRepositoryImpl(this._auth);

  @override
  Future<SignUpResponse> register(SignUpData data) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
          email: data.email, password: data.password);
      await userCredential.user!
          .updateDisplayName("${data.name} ${data.lastname}");
      return SignUpResponse(null, userCredential.user);
    } on FirebaseAuthException catch (e) {
      return SignUpResponse(e.code, null);
    }
  }
}
