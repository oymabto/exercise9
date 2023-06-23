import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'RegisterPage.dart';
import 'UserPage.dart';
import 'UsersPage.dart';
import 'firebase_options.dart';

import 'AboutUs.dart';
import 'ContactUs.dart';
import 'HomePage.dart';
import 'model/UserRepository.dart';

void main() async {
  // 'WidgetsFlutterBinding.ensureInitialized()' ensures that Flutter initializes the necessary bindings.
  WidgetsFlutterBinding.ensureInitialized();

  // 'await Firebase.initializeApp(...)' initializes Firebase services using the initializeApp method from firebase_core.
  // The options parameter specifies the configuration options for Firebase, which are provided by DefaultFirebaseOptions.currentPlatform.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 'runApp(const MyApp())' runs the MyApp widget as the root widget of the application.
  runApp(const MyApp());
}

//  It extends StatelessWidget since it doesn't have any mutable state.
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  const MyApp({super.key});

  @override
  // The build method is overridden to define the UI structure of the application.
  Widget build(BuildContext context) {
    // 'MultiProvider' is used to provide the UserRepository to all the descendant widgets that depend on it.
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => UserRepository()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routes: {
            'Home': (BuildContext context) => const HomePage(),
            'Users': (BuildContext context) => const UsersPage(),
            'User': (BuildContext context) => const UserPage(),
            'ContactUs': (BuildContext context) => const ContactUs(),
            'AboutUs': (BuildContext context) => const AboutUs(),
            'Register': (BuildContext context) => const RegisterPage()
          },

          //  The home property of MaterialApp specifies the widget to be shown as the initial screen of the application.
          home: const HomePage(),
        ));
  }
}
