abstract class FavoritesService {
  Future<List<String>> getFavorites();
  Future<void> addFavorite(String item);
  Future<void> removeFavorite(String item);
}
