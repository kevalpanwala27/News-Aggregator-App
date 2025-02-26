import 'package:get/get.dart';
import '../services/api_service.dart';

class NewsController extends GetxController {
  var newsList = [].obs;
  var isLoading = true.obs;
  var isLoadingMore = false.obs;
  var selectedCategory = "general".obs;
  var currentPage = 1.obs;

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  void fetchNews({int page = 1}) async {
    try {
      if (page == 1) {
        isLoading(true);
        newsList.clear();
      } else {
        isLoadingMore(true);
      }

      var news = await ApiService.fetchNews(
        category: selectedCategory.value,
        page: page,
      );
      newsList.addAll(news);

      currentPage.value = page;
    } finally {
      isLoading(false);
      isLoadingMore(false);
    }
  }

  void updateCategory(String category) {
    selectedCategory.value = category;
    currentPage.value = 1;
    fetchNews(page: 1);
  }

  void loadMoreNews() {
    if (!isLoadingMore.value) {
      fetchNews(page: currentPage.value + 1);
    }
  }
}
