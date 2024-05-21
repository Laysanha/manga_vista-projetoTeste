import 'package:flutter/material.dart';
import 'package:manga_vista/components/account_menu.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  get actions => null;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Comic Vista'),
          Row(
            children: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.notifications)),
              IconButton(
                  onPressed: (){
                    showModalBottomSheet(
                        context: context,
                        isDismissible: true,
                        enableDrag: true,
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