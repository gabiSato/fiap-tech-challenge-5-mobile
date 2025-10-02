import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:fiap_farms/ui/auth/login/widgets/login_screen.dart';
import 'package:fiap_farms/ui/core/themes/theme.dart';
import 'package:fiap_farms/ui/core/themes/texts.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final auth = FirebaseAuth.instanceFor(app: Firebase.app());
  await auth.setPersistence(Persistence.LOCAL);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Lato", "Lato");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      title: 'Farms',
      theme: theme.light(),
      darkTheme: theme.dark(),
      themeMode: ThemeMode.system,
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
