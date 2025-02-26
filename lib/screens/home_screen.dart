import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/news_controller.dart';
import 'news_details.dart';

class HomeScreen extends StatelessWidget {
  final NewsController newsController = Get.put(NewsController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "News Aggregator App",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          elevation: 5,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Obx(
                () => SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...[
                        "General",
                        "Business",
                        "Sports",
                        "Technology",
                        "Health",
                        "Science",
                        "Entertainment",
                      ].map(
                        (cat) => GestureDetector(
                          onTap:
                              () => newsController.updateCategory(
                                cat.toLowerCase(),
                              ),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  newsController.selectedCategory.value ==
                                          cat.toLowerCase()
                                      ? Colors.blueAccent
                                      : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.blueAccent),
                            ),
                            child: Text(
                              cat,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color:
                                    newsController.selectedCategory.value ==
                                            cat.toLowerCase()
                                        ? Colors.white
                                        : Colors.blueAccent,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: Obx(() {
                  if (newsController.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.blueAccent,
                      ),
                    );
                  }

                  return NotificationListener<ScrollNotification>(
                    onNotification: (scrollInfo) {
                      if (scrollInfo.metrics.pixels ==
                          scrollInfo.metrics.maxScrollExtent) {
                        newsController.loadMoreNews();
                      }
                      return false;
                    },
                    child: ListView.builder(
                      itemCount: newsController.newsList.length + 1,
                      itemBuilder: (context, index) {
                        if (index == newsController.newsList.length) {
                          return newsController.isLoadingMore.value
                              ? const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.blueAccent,
                                  ),
                                ),
                              )
                              : const SizedBox();
                        }

                        var news = newsController.newsList[index];

                        return GestureDetector(
                          onTap: () => Get.to(() => NewsDetails(news: news)),
                          child: Card(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                  child: Image.network(
                                    news["urlToImage"] ??
                                        "https://via.placeholder.com/400",
                                    height: 200,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        news["title"],
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        news["source"]["name"] ??
                                            "Unknown Source",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey.shade700,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            news["publishedAt"]?.substring(
                                                  0,
                                                  10,
                                                ) ??
                                                "No Date",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey.shade500,
                                            ),
                                          ),
                                          const Icon(
                                            Icons.arrow_forward_ios,
                                            size: 16,
                                            color: Colors.blueAccent,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
