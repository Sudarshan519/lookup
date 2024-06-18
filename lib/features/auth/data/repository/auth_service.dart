import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:lookup/features/auth/domain/repository/auth_service_interface.dart';
import 'package:lookup/features/auth/data/repository/auth_failure.dart';

class AuthService implements AuthServiceInterface {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  @override
  Future<Either<AuthFailure, User>> signInWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = userCredential.user;
      if (user==null){
        return Left(AuthFailure(message: "No user found"));
      }
      return Right(user);
    } catch (e) {
      return Left(AuthFailure(message: e.toString()));
    }
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }
  
  @override 
User? get user =>_auth.currentUser;

  @override
  Future<Either<AuthFailure, User>> signUpWithEmailAndPassword(String email, String password)async {
     try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = userCredential.user;
      if (user==null){
        return Left(AuthFailure(message: "No user found"));
      }
      return Right(user);
    } catch (e) {
      return Left(AuthFailure(message: e.toString()));
    }
  }
}
