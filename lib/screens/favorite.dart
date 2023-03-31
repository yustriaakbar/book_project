import 'package:flutter/material.dart';
import 'package:mini_project/provider/favorite_provider.dart';
import 'package:mini_project/models/popular_book.dart';

class FavoritePage extends StatelessWidget {
  final List<PopularBookModel> popularBookData;
  const FavoritePage({Key? key, required this.popularBookData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: popularBookData.length,
        itemBuilder: (context, index) {
          final PopularBookModel book = popularBookData[index];
          return ListTile(
            title: Text(book.title),
            trailing: IconButton(
              onPressed: () {
                provider.toggleFavorite(book);
              },
              icon: provider.isExist(book)
                  ? const Icon(Icons.favorite, color: Colors.red)
                  : const Icon(Icons.favorite_border),
            ),
          );
        },
      ),
    );
  }
}