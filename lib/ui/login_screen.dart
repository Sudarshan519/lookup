import 'package:flutter/material.dart';
import 'package:lookup/ui/auth/login_screen.dart';
import 'package:lookup/ui/home/home_screen.dart';
import 'package:lookup/ui/widgets/auth_button.dart';
import 'package:provider/provider.dart';
import 'package:lookup/features/auth/presentation/auth_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<FirebaseAuthProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: NewCustomWidget(
                      height: MediaQuery.of(context).size.height * .6,
                      width: double.infinity,
                    )),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Center(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 100,
                            ),
                            Hero(
                              tag: 'logo',
                              child: Text(
                                "LOOK UP",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 28,
                                        color: Colors.white),
                              ),
                            ),
                            Text(
                              "Please fill your login details",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Login',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(color: Colors.white),
                          ),
                          TextField(
                            style: const TextStyle(color: Colors.white),
                            controller: _emailController,
                            decoration: const InputDecoration(
                                labelStyle: TextStyle(color: Colors.white),
                                labelText: 'Email',
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                          ),
                          TextField(
                            style: const TextStyle(color: Colors.white),
                            controller: _passwordController,
                            decoration: const InputDecoration(
                                labelStyle: TextStyle(color: Colors.white),
                                labelText: 'Password',
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                            obscureText: true,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                    height: MediaQuery.of(context).size.height * .6,
                    alignment: Alignment.bottomCenter,
                    child: LoginPageButtons(
                        emailController: _emailController,
                        passwordController: _passwordController,
                        authProvider: authProvider)),
                const SizedBox(
                  height: 12,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * .6),
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 32,
                                ),
                                const Text("or login in with sdfsdf"),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Row(
                                  children: [
                                    const SocialLoginButton(
                                        icon: FontAwesomeIcons.google),
                                    SocialLoginButton(
                                        icon: FontAwesomeIcons.facebook),
                                    SocialLoginButton(
                                        icon: FontAwesomeIcons.twitter),
                                  ],
                                ),
                                SignupTextWidget(),
                              ],
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SignupTextWidget extends StatelessWidget {
  const SignupTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: "Don't have account ?",
          style: TextStyle(color: Colors.grey.shade800)),
      TextSpan(text: "Signup.", style: TextStyle(color: Colors.grey.shade800)),
    ], style: const TextStyle(color: Colors.black)));
  }
}

class LoginPageButtons extends StatelessWidget {
  const LoginPageButtons({
    super.key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required this.authProvider,
  })  : _emailController = emailController,
        _passwordController = passwordController;

  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final FirebaseAuthProvider authProvider;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 36,
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Color(0x33000000),
                offset: Offset(
                  0,
                  2,
                ),
              ),
            ]),
            child: AuthButton(
              label: 'SIGNUP',
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
            )),
        const SizedBox(
          width: 20,
        ),
        Container(
          height: 36,
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x33000000),
              offset: Offset(
                0,
                2,
              ),
            ),
          ]),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color(0xff4B39EF),
              foregroundColor: Colors.white,
              side: const BorderSide(color: Colors.white, width: 1.6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () async {
              String email = _emailController.text.trim();
              String password = _passwordController.text.trim();
              var result = await authProvider.signIn(email, password);

              // Handle authentication result
              result.fold(
                  (failureMessage) => {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(failureMessage.message),
                            duration: const Duration(seconds: 3),
                          ),
                        )
                      }, (success) {
                Navigator.pushNamed(context, '/home');
              });
            },
            child: const Text('Login'),
          ),
        ),
      ],
    );
  }
}

class NewCustomWidget extends StatefulWidget {
  const NewCustomWidget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<NewCustomWidget> createState() => _NewCustomWidgetState();
}

class _NewCustomWidgetState extends State<NewCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return OvalClipper(height: widget.height!, width: widget.width!);
  }
}

class OvalClipper extends StatelessWidget {
  final double height;
  final double width;

  const OvalClipper({super.key, required this.height, required this.width});
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: InvertedBottomOvalClipper(),
      child: Container(
          color: const Color(0xff4B39EF), height: height, width: width),
    );
  }
}

class InvertedBottomOvalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(
      size.width / 2, size.height, // Control point
      size.width, size.height - 30, // End point
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
