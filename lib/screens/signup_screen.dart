import 'package:flutter/material.dart';
import 'package:lookup/screens/widgets/auth_button.dart';
import 'package:provider/provider.dart';
import 'package:lookup/providers/auth_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: Column(
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
                          SizedBox(
                            height: 100,
                          ),
                          Text(
                            "LOOK UP",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 28,
                                    color: Colors.white),
                          ),
                          Text(
                            "Please fill your signup details",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Signup',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: Colors.white),
                        ),
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.white),
                              labelText: 'Email',
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                        ),
                        TextField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                              labelStyle: TextStyle(color: Colors.white),
                              labelText: 'Password',
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
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
                  child: LoginButtons(
                      emailController: _emailController,
                      passwordController: _passwordController,
                      authProvider: authProvider)),
             
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .6),
                      alignment: Alignment.center,
                      child: Column(
                        children: const [
                          SizedBox(
                            height: 32,
                          ),
                          Text("or login in with"),
                          SizedBox(
                            height: 8,
                          ),
                         Row(children: [ SocialLoginButton(icon:FontAwesomeIcons.google),
                           SocialLoginButton(icon:FontAwesomeIcons.facebook),
                            SocialLoginButton(icon:FontAwesomeIcons.twitter),],)
                        ],
                      )),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.icon
  });
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x33000000),
              offset: Offset(
                0,
                2,
              ),
            )
          ]),
      child: Icon(icon),
    );
  }
}

class LoginButtons extends StatelessWidget {
  const LoginButtons({
    super.key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required this.authProvider,
  })  : _emailController = emailController,
        _passwordController = passwordController;

  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final AuthProvider authProvider;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
           
            decoration: BoxDecoration(boxShadow:const [  BoxShadow(
              blurRadius: 4,
              color: Color(0x33000000),
              offset: Offset(
                0,
                2,
              ),
            ),]),
            child: AuthButton(
              label: 'Login',
              onPressed: () {},
            )),
        SizedBox(
          width: 20,
        ),
        Container(
         
          decoration: BoxDecoration(boxShadow:const [  BoxShadow(
              blurRadius: 4,
              color: Color(0x33000000),
              offset: Offset(
                0,
                2,
              ),
            ),]),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 21, 101, 192),
              foregroundColor: Colors.white,
              side: BorderSide(color: Colors.white,width: 1),
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
                      },
                  (success) {});
            },
            child: const Text('Signup'),
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
      child:
          Container(color: const Color.fromARGB(255, 21, 101, 192), height: height, width: width),
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
