import 'package:flutter/material.dart';
import 'package:lookup/screens/detail_screen.dart';
import 'package:lookup/screens/home_screen.dart';
import 'package:lookup/screens/login_screen.dart';
import 'package:lookup/screens/signup_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lookup/providers/auth_provider.dart';
import 'package:lookup/screens/splash_screen.dart';
import 'package:lookup/usecases/authentication_usecase.dart';
import 'package:lookup/services/auth_service.dart';

void main() async {
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
          create: (_) => AuthProvider(AuthenticationUseCase(AuthService())),
        ),
      ],
      child: MaterialApp(
        title: 'Lookup',
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 21, 101, 192),
        ),
        onGenerateRoute:(settings) {
          switch (settings.name) {
            case '/':
                  return MaterialPageRoute(builder: (_) => SplashScreen());
               case '/home':return MaterialPageRoute(builder: (_) => HomeScreen());
               case '/detail':
            var args = settings.arguments as Map<String, dynamic>?;
            String? image = args?['image'];

                  return MaterialPageRoute(builder:(_)=>DetailScreen(image: image??'' )   );
            default:
          }
         
         
         
 },
        home: const SplashScreen(), // Start with SplashScreen
      ),
    );
  }
}
