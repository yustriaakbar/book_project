import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mini_project/models/popular_book.dart';

class FavoriteProvider extends ChangeNotifier {
  List<PopularBookModel> _words = [];
  List<PopularBookModel> get words => _words;

  void toggleFavorite(PopularBookModel word) {
    final isExist = _words.contains(word);
    if (isExist) {
      _words.remove(word);
    } else {
      _words.add(word);
    }
    notifyListeners();
  }

  bool isExist(PopularBookModel word) {
    final isExist = _words.contains(word);
    return isExist;
  }

  void clearFavorite() {
    _words = [];
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