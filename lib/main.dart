import 'package:flutter/material.dart';
import 'package:manga_vista/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'components/app_navigation.dart';

void main() {
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
          home: const AppNavigation(),
        );
      },
    );
  }
}
