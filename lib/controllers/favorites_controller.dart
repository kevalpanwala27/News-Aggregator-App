import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FavoritesController extends GetxController {
  final box = GetStorage();
  var favorites = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  void loadFavorites() {
    var storedFavorites = box.read<List>('favorites') ?? [];
    favorites.assignAll(storedFavorites.cast<Map<String, dynamic>>());
  }

  void toggleFavorite(Map<String, dynamic> article) {
    if (isFavorite(article)) {
      favorites.removeWhere((item) => item["title"] == article["title"]);
    } else {
      favorites.add(article);
    }
    box.write('favorites', favorites);
  }

  bool isFavorite(Map<String, dynamic> article) {
    return favorites.any((item) => item["title"] == article["title"]);
  }
}
