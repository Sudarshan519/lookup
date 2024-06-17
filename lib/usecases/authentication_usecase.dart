import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lookup/services/auth_service_interface.dart';
import 'package:lookup/usecases/auth_usecase_failure.dart';

class AuthenticationUseCase {
  final AuthServiceInterface _authService;

  AuthenticationUseCase(this._authService);
User? currentUser()=>_authService.user;
  Future<Either<AuthUseCaseFailure, User>> signIn(String email, String password) async {
    final result = await _authService.signInWithEmailAndPassword(email, password);
    return result.fold(
      (failure) => Left(AuthUseCaseFailure(message: failure.message)),
      (user) => Right(user),
    );
  }
  Future<Either<AuthUseCaseFailure, User>> signUp(String email, String password) async {
    final result = await _authService.signInWithEmailAndPassword(email, password);
    return result.fold(
      (failure) => Left(AuthUseCaseFailure(message: failure.message)),
      (user) => Right(user),
    );
  }
  Future<void> signOut() async {
    await _authService.signOut();
  }
}
