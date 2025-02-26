import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/favorites_controller.dart';
import 'news_details.dart';

class FavoritesScreen extends StatelessWidget {
  final FavoritesController favoritesController = Get.find();

  FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite News"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Obx(() {
        if (favoritesController.favorites.isEmpty) {
          return const Center(child: Text("No favorite news yet"));
        }

        return ListView.builder(
          itemCount: favoritesController.favorites.length,
          itemBuilder: (context, index) {
            var news = favoritesController.favorites[index];

            return ListTile(
              title: Text(news["title"]),
              subtitle: Text(news["source"]["name"] ?? "Unknown Source"),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  favoritesController.toggleFavorite(news);
                },
              ),
              onTap: () => Get.to(() => NewsDetails(news: news)),
            );
          },
        );
      }),
    );
  }
}
