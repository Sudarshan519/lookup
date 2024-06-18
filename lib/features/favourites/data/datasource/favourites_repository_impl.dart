import 'package:lookup/features/favourites/data/repository/favourites_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  late SharedPreferences _prefs;
  @override
  Future<void> initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<List<String>> getFavorites() async {
    return _prefs.getStringList('favorites') ?? [];
  }

  @override
  Future<void> addFavorite(String item) async {
    List<String> favorites = _prefs.getStringList('favorites') ?? [];
    if (!favorites.contains(item)) {
      favorites.add(item);
      await _prefs.setStringList('favorites', favorites);
    }
  }

  @override
  Future<void> removeFavorite(String item) async {
    List<String> favorites = _prefs.getStringList('favorites') ?? [];
    favorites.remove(item);
    await _prefs.setStringList('favorites', favorites);
  }
}
