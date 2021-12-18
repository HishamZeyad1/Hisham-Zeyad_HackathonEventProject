import 'package:elancer_api/api/controllers/auth_api_controller.dart';
import 'package:elancer_api/helpers/helpers.dart';
import 'package:elancer_api/screens/categories_screen.dart';
import 'package:elancer_api/widgets/app_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Helpers {
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;

  late TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();

    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = navigateToRegisterScreen;
    // _tapGestureRecognizer.onTap = navigateToRegisterScreen;
  }

  void navigateToRegisterScreen() {
    Navigator.pushNamed(context, '/register_screen');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 100),
          children: [
            Text(
              'UCAS Events',
              style: GoogleFonts.pacifico(
                textStyle: TextStyle(
                  fontSize: 45,
                  color: Color(0xff253975),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Welcome to back',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Login with',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    fontSize: 22,
                    color: Color(0xff253975),
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Phone",
              style: GoogleFonts.roboto(
                textStyle: TextStyle(fontSize:15,color:Colors.black ,),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            AppTextField(
              hint: 'Enter your phone',
              controller: _emailTextController,
              // prefixIcon: Icons.email,
            ),
            SizedBox(
              height: 21,
            ),
            Text(
              "Password",
              style: GoogleFonts.roboto(
                textStyle: TextStyle(fontSize:15,color:Colors.black ,),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            AppTextField(
              hint: 'Enter your Password',
              controller: _passwordTextController,
              // prefixIcon: Icons.email,
            ),
            SizedBox(
              height: 60,
            ),
                ElevatedButton(
                  onPressed: () async =>await performLogin(),
                  child: const Text('LOGIN'),

                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff253975),
                    padding: EdgeInsets.symmetric(horizontal: 9),
                    minimumSize: const Size(0, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
          ]
          // body: ListView(
          //   physics: const NeverScrollableScrollPhysics(),
          //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          //   children: [
          //     const Text(
          //       'Welcome back...',
          //       style: TextStyle(
          //         color: Colors.black,
          //         fontWeight: FontWeight.bold,
          //         fontSize: 22,
          //       ),
          //     ),
          //     const Text(
          //       'Enter your email & password',
          //       style: TextStyle(
          //         color: Colors.grey,
          //         fontSize: 16,
          //       ),
          //     ),
          //     const SizedBox(height: 15),
          //     AppTextField(
          //       hint: 'Email',
          //       controller: _emailTextController,
          //       prefixIcon: Icons.email,
          //     ),
          //     const SizedBox(height: 10),
          //     AppTextField(
          //       hint: 'Password',
          //       controller: _passwordTextController,
          //       prefixIcon: Icons.lock,
          //       obscureText: true,
          //     ),
          //     const SizedBox(height: 15),
          //     ElevatedButton(
          //       onPressed: () async => await performLogin(),
          //       child: const Text('LOGIN'),
          //       style: ElevatedButton.styleFrom(
          //         minimumSize: const Size(0, 50),
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(10),
          //         ),
          //       ),
          //     ),
          //     SizedBox(height: 10),
          //     RichText(
          //       textAlign: TextAlign.center,
          //       text: TextSpan(
          //         text: 'Don\'t have an account?',
          //         style: const TextStyle(
          //           color: Colors.black,
          //         ),
          //         children: [
          //           const TextSpan(text: ' '),
          //           TextSpan(
          //             recognizer: _tapGestureRecognizer,
          //             text: 'Create Now!',
          //             style: const TextStyle(
          //               color: Colors.blue,
          //             ),
          //           )
          //         ],
          //       ),
          //     ),
          //     TextButton(
          //       onPressed: () => Navigator.pushNamed(context, '/forget_password_screen'),
          //       child: const Text("Forget Password?"),
          //     )
          //   ],
          // ),
          ),
    );
  }

  Future<void> performLogin() async {
    if (checkData()) {
      await login();
    }
  }

  bool checkData() {
    if (_emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(
      context: context,
      message: 'Enter required data!',
      error: true,
    );
    return false;
  }

  Future<void> login() async {
    bool status = await AuthApiController().login(
      context,
      email: _emailTextController.text,
      password: _passwordTextController.text,
    );
    if (status) Navigator.pushReplacementNamed(context, '/categories_screen');
  }
}
