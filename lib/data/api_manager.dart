import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_online_c4/data/model/news_response.dart';
import 'package:news_online_c4/data/model/sources_response.dart';

class ApiManager {
  static const String apiKey = '5909ae28122a471d8b0c237d5989cb73';
  static const String baseUrl = 'newsapi.org';

  static Future<SourcesResponse> loadNewsSources(String category) async {
    var params = {'apiKey': apiKey, 'category': category};
    var uri = Uri.https(baseUrl, '/v2/top-headlines/sources', params);
    var response = await http.get(uri);

    var sourcesResponse = SourcesResponse.fromJson(jsonDecode(response.body));

    if (response.statusCode == 200) {
      return sourcesResponse;
    }

    if (sourcesResponse.message != null)
      throw Exception(sourcesResponse.message);

    throw Exception("error loading news sources");
  }

  static Future<NewsResponse> loadNews([String? sources, String? query]) async {
    var params = {'apiKey': apiKey, 'sources': sources, 'qInTitle': query};
    var uri = Uri.https(baseUrl, "/v2/everything", params);

    var response = await http.get(uri);
    var newsResponse = NewsResponse.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return newsResponse;
    }
    if (newsResponse.message != null) throw Exception(newsResponse.message);

    throw Exception("error loading news sources");
  }
}
