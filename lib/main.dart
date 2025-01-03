import 'package:firebase/view_model/event_view_model.dart';
import 'package:firebase/views/add_event_page.dart';
import 'package:firebase/views/home_page.dart';
import 'package:firebase/views/sign_in_page.dart';
import 'package:firebase/views/sign_up_page.dart';
import 'package:firebase/views/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EventViewModel(),
      builder: (context, _) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash_page',
        routes: {
          '/splash_page': (context) => SplashPage(),
          '/home_page': (context) => HomePage(),
          '/add_event_page': (context) => AddEventPage(),
          '/sign_up_page': (context) => SignUpPage(),
          '/sign_in_page': (context) => SignInPage(),
        },
      ),
    );
  }
}
