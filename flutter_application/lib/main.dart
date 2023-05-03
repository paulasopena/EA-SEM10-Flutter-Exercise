import 'package:flutter/material.dart';
import 'package:flutter_application/src/info_screen.dart';
import 'package:flutter_application/src/list_screen.dart';
import 'package:flutter_application/src/login_screen.dart';
import 'package:flutter_application/src/profile_screen.dart';
import 'package:flutter_application/src/register_screen.dart';

void main() => runApp( const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material Login',
      home:LoginScreen(),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/list_screen':
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(builder: (context) => ListScreen(idUser: args['idUser']));
          case '/register_screen':
            return MaterialPageRoute(builder: (context) => RegisterScreen());
          case '/info_screen':
            return MaterialPageRoute(builder: (context)=> InfoScreen());
          case '/profile_screen':
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(builder: (context) => ProfileScreen(idUser: args['idUser']));
          default: 
            return MaterialPageRoute(builder: (context) => LoginScreen());
        }
      }
    );
  }
}

