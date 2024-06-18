import 'package:flutter/material.dart';
import 'package:lookup/app/init_dependencies.dart';
import 'package:lookup/config/routes/rotues.dart';
import 'package:lookup/features/favourites/presentation/favourites_provider.dart';

import 'package:provider/provider.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:lookup/features/auth/presentation/auth_provider.dart';
import 'package:lookup/ui/splash/splash_screen.dart';
import 'package:lookup/features/auth/domain/usecases/authentication_usecase.dart';
import 'package:lookup/features/auth/data/repository/auth_service.dart';

import 'core/constants/app_constants.dart';

void main() async {
  await appInit(appEnv: AppEnv.PROD);
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) =>
              FirebaseAuthProvider(AuthenticationUseCase(AuthService())),
        ),
        ChangeNotifierProvider(
          create: (_) => FavoritesProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Lookup',
        theme: ThemeData(
          primaryColor: const Color(0xff4B39EF),
        ),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        home: const SplashScreen(), // Start with SplashScreen
      ),
    );
  }
}
