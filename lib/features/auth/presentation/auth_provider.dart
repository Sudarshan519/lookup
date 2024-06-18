import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';
import 'package:lookup/features/auth/domain/usecases/authentication_usecase.dart';
import 'package:lookup/features/auth/domain/usecases/auth_usecase_failure.dart';

class FirebaseAuthProvider extends ChangeNotifier {
  final AuthenticationUseCase _authUseCase;
  User? _user;

  FirebaseAuthProvider(this._authUseCase) {
    // Initialize auth state
    _init();
  }

  void _init() {
    _user = _authUseCase.currentUser();
    notifyListeners();
  }

  User? get user => _user;

  Future<Either<AuthUseCaseFailure, User>> signIn(
      String email, String password) async {
    Either<AuthUseCaseFailure, User> result =
        await _authUseCase.signIn(email, password);
    result.fold((left) {}, (user) {
      _user = user;
      notifyListeners();
    });
    return result;
  }

  Future<Either<AuthUseCaseFailure, User>> signup(
      String email, String password) async {
    Either<AuthUseCaseFailure, User> result =
        await _authUseCase.signUp(email, password);
    result.fold((left) {}, (user) {
      _user = user;
      notifyListeners();
    });
    return result;
  }

  Future<void> signOut() async {
    await _authUseCase.signOut();
    _user = null;
    notifyListeners();
  }
}
