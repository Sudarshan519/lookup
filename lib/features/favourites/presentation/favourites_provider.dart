import 'package:flutter/material.dart';
import 'package:lookup/features/favourites/data/datasource/favourites_repository_impl.dart';
import 'package:lookup/features/favourites/data/repository/favourites_repository.dart';

class FavoritesProvider with ChangeNotifier {
  final FavoritesRepository _repository = FavoritesRepositoryImpl();
  List<String> _favorites = [];

  FavoritesProvider() {
    _loadFavorites();
  }

  List<String> get favorites => _favorites;

  Future<void> _loadFavorites() async {
    await _repository.initPrefs();
    _favorites = await _repository.getFavorites();
    notifyListeners();
  }

  Future<void> addFavorite(String itemName) async {
    await _repository.addFavorite(itemName);
    await _loadFavorites();
  }

  Future<void> removeFavorite(String itemName) async {
    await _repository.removeFavorite(itemName);
    await _loadFavorites();
  }

  Future<void> addOrRemoveFavourite(String image) async {
    if (isFavourite(image)) {
      await removeFavorite(image);
    } else {
      await addFavorite(image);
    }
  }

  bool isFavourite(String image) {
    return _favorites.contains(image);
  }
}
