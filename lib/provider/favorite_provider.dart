import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mini_project/models/popular_book.dart';

class FavoriteProvider extends ChangeNotifier {
  List<PopularBookModel> _favoriteBookList = [];
  List<PopularBookModel> get favoriteBookList => _favoriteBookList;

  void toggleFavorite(PopularBookModel word) {
    final isExist =_favoriteBookList.contains(word);
    if (isExist) {
      _favoriteBookList.remove(word);
    } else {
      _favoriteBookList.add(word);
    }
    notifyListeners();
  }

  bool isExist(PopularBookModel word) {
    final isExist = _favoriteBookList.contains(word);
    return isExist;
  }

  void clearFavorite() {
    _favoriteBookList = [];
    notifyListeners();
  }

  static FavoriteProvider of(
      BuildContext context, {
        bool listen = true,
      }) {
    return Provider.of<FavoriteProvider>(
      context,
      listen: listen,
    );
  }
}