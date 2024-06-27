import 'package:flutter/material.dart';
import 'package:manga_vista/pages/page_login.dart';
import 'package:manga_vista/providers/theme_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: ( context, themeProvider, _) {
        return MaterialApp(
          title: 'Manga Vista',
          theme: themeProvider.currentTheme,
          home: const LoginPage(),
        );
      },
    );
  }
}
