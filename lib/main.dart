import 'package:elancer_api/prefs/shared_pref_controller.dart';
import 'package:elancer_api/screens/auth/login_screen.dart';
import 'package:elancer_api/screens/auth/password/forget_password_screen.dart';
import 'package:elancer_api/screens/auth/password/reset_password_screen.dart';
import 'package:elancer_api/screens/auth/register_screen.dart';
import 'package:elancer_api/screens/categories_screen.dart';
import 'package:elancer_api/screens/images/images_screen.dart';
import 'package:elancer_api/screens/images/upload_image_screen.dart';
import 'package:elancer_api/screens/launch_screen.dart';
import 'package:elancer_api/screens/users_screen.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPref();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/launch_screen',
      routes: {
        '/launch_screen': (context) => LaunchScreen(),
        '/login_screen': (context) => LoginScreen(),
        '/register_screen': (context) => RegisterScreen(),
        '/forget_password_screen': (context) => ForgetPasswordScreen(),
        // '/reset_password_screen': (context) => ResetPasswordScreen(),
        '/users_screen': (context) => UsersScreen(),
        '/categories_screen': (context) => CategoriesScreen(),
        '/images_screen': (context) => ImagesScreen(),
        '/upload_image_screen': (context) => UploadImageScreen(),
      },
    );
  }
}
