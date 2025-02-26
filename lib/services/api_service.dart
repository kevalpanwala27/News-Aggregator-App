import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = "http://192.168.57.136:3001/news";
  static const int pageSize = 10;
  static Future<List<dynamic>> fetchNews({
    String category = "general",
    required int page,
  }) async {
    try {
      final url = Uri.parse(
        "$baseUrl?category=$category&page=$page&pageSize=$pageSize",
      );
      print("Fetching news from: $url");

      final response = await http.get(url);
      print("Response Status: ${response.statusCode}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data["articles"] != null && data["articles"] is List) {
          return data["articles"];
        } else {
          print("Warning: No articles found in response.");
          return [];
        }
      } else {
        print(
          "Error: Failed to fetch news (Status Code: ${response.statusCode})",
        );
        return [];
      }
    } catch (e) {
      print("Exception fetching news: $e");
      return [];
    }
  }
}
