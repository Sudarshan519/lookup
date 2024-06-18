abstract class FavoritesRepository {
  Future<List<String>> getFavorites();
  Future<void> addFavorite(String item);
  Future<void> removeFavorite(String item);
  Future<void> initPrefs();
}
