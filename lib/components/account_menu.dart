import 'package:flutter/material.dart';
import 'package:manga_vista/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class AccountMenu extends StatelessWidget {
  const AccountMenu({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _){
        return ListView(
          children: <Widget>[
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 28, 12, 12),
                child: Text(
                  "Meu Perfil",
                  style: TextStyle(fontSize: 26),
                  textAlign: TextAlign.start,
                ),
              ),
              InkWell(
                onTap: (){},
                child: const ListTile(
                  title: Text("Editar perfil"),
                  leading: Icon(Icons.account_circle),
                ),
              ),
              InkWell(
                onTap: (){},
                child: const ListTile(
                  title: Text("Favoritos/Lidos"),
                  leading: Icon(Icons.star),
                ),
              ),
              InkWell(
                onTap: (){
                  final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
                  themeProvider.toggleTheme();
                },
                child: ListTile(
                  title: const Text("Tema"),
                  leading: Consumer<ThemeProvider>(builder: (context, themeProvider, _) {
                    return Icon(
                      themeProvider.currentTheme.brightness ==
                          Brightness.light ? Icons.light_mode : Icons.dark_mode,
                    );
                  },)
                  )
              )
            ]
          );
        }
    );
  }
}
