import 'package:dio/dio.dart';
import 'package:news/Models/news_model.dart';

class NewsServices {
  static Dio dio = Dio();
  static Future<NewsModel> getAll() async {
    try {
      const url = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=02a63347dba54e61ad8312004419737a";
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        return NewsModel.fromJson(response.data);
      } else {
        throw ("404");
      }
    } catch (e) {
      throw(e.toString());
    }
  }
}