import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lookup/features/auth/data/models/user.dart';
import 'package:lookup/features/auth/data/repository/auth_failure.dart';

abstract class AuthServiceInterface {
  Stream<User?> get authStateChanges;
  User? get user;
  Future<Either<AuthFailure, User>> signInWithEmailAndPassword(String email, String password);
   Future<Either<AuthFailure, User>> signUpWithEmailAndPassword(String email, String password);
  Future<void> signOut();
}
