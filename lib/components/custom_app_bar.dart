import 'package:flutter/material.dart';
import 'package:manga_vista/components/account_menu.dart';
import 'package:manga_vista/pages/page_notification.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showButtons;
  const CustomAppBar({super.key, this.showButtons = true});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Manga Vista'),
          if (showButtons)
            Row(
              children: [
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PageNotificacao()));
                }, icon: const Icon(Icons.notifications)),
                IconButton(
                    onPressed: (){
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context){
                            return const AccountMenu();
                          }
                      );
                    },
                    icon: const Icon(Icons.account_circle_rounded)
                ),
              ],
            )
        ],
      ),
    );
  }
}
