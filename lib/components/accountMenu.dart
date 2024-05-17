import 'package:flutter/material.dart';

class AccountMenu extends StatelessWidget {
  const AccountMenu({super.key});

  @override
  Widget build(BuildContext context) {
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
          onTap: (){},
          child: const ListTile(
            title: Text("Tema"),
            leading: Icon(Icons.light_mode),
          )
        )
      ],
    );
  }
}
