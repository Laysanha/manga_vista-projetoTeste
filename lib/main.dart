import 'package:flutter/material.dart';
<<<<<<<<< Temporary merge branch 1
import 'package:manga_vista/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'components/app_navigation.dart';
=========
import 'package:manga_vista/database/database.dart';
import 'package:manga_vista/pages/page_category.dart';
import 'package:manga_vista/pages/page_home.dart';
import 'package:manga_vista/pages/page_library.dart';
import 'package:manga_vista/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'components/custom_app_bar.dart';
import 'controllers/obra_controller.dart';

Future<void> main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  // Initialize FiFI
  // sqfliteFfiInit();
  // databaseFactory = databaseFactoryFfi;
  // await DatabaseHelper.instance.initDatabase();
>>>>>>>>> Temporary merge branch 2

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
