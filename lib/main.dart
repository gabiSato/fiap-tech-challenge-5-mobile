import 'package:flutter/material.dart';

import 'package:fiap_farms/ui/core/themes/theme.dart';
import 'package:fiap_farms/ui/core/themes/texts.dart';

void main() {
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
      home: Scaffold(),
      debugShowCheckedModeBanner: false,
    );
  }
}
