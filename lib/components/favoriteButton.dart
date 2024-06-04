import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}
class _FavoriteButtonState extends State<FavoriteButton> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {
          _isFavorite = !_isFavorite;
        });
        String message = _isFavorite ? 'Manga Favoritado!' : 'Removido dos Favoritos!';
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
            content: Text(message),
            duration: const Duration(seconds: 1),
          ),
        );

      },
      child: _isFavorite ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border)
    );
  }
}
