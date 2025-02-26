import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
  final Map<String, dynamic> news;

  const NewsDetails({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            news["title"] ?? "News Details",
            style: const TextStyle(fontSize: 16),
          ),
          backgroundColor: isDarkMode ? Colors.black87 : Colors.blueAccent,
          iconTheme: IconThemeData(
            color: isDarkMode ? Colors.white : Colors.white,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child:
                      news["urlToImage"] != null
                          ? Image.network(
                            news["urlToImage"],
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 220,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                "assets/placeholder.png",
                                width: double.infinity,
                                height: 220,
                                fit: BoxFit.cover,
                              );
                            },
                          )
                          : Image.asset(
                            "assets/placeholder.png",
                            width: double.infinity,
                            height: 220,
                            fit: BoxFit.cover,
                          ),
                ),
                const SizedBox(height: 16),
                Text(
                  news["title"] ?? "No title available",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        news["source"]["name"] ?? "Unknown Source",
                        style: TextStyle(
                          fontSize: 14,
                          color:
                              isDarkMode
                                  ? Colors.grey.shade400
                                  : Colors.blueGrey,
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      news["publishedAt"]?.substring(0, 10) ?? "No Date",
                      style: TextStyle(
                        fontSize: 14,
                        color:
                            isDarkMode ? Colors.grey.shade400 : Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
                const Divider(thickness: 1, height: 20),
                Text(
                  news["description"] ?? "No description available.",
                  style: TextStyle(
                    fontSize: 16,
                    color: isDarkMode ? Colors.white70 : Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                if (news["url"] != null)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _launchURL(news["url"]),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Read Full Article",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
      ),
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}
