import 'package:lookup/features/favourites/data/datasource/favourites_repository_impl.dart';
import 'package:lookup/features/favourites/data/repository/favourites_repository.dart';
import 'package:lookup/features/favourites/domain/repository/favourite_interface.dart';

class FavoritesServiceImpl implements FavoritesService {
  final FavoritesRepository _repository = FavoritesRepositoryImpl();

  @override
  Future<List<String>> getFavorites() {
    return _repository.getFavorites();
  }

  @override
  Future<void> addFavorite(String item) {
    return _repository.addFavorite(item);
  }

  @override
  Future<void> removeFavorite(String item) {
    return _repository.removeFavorite(item);
  }
}
