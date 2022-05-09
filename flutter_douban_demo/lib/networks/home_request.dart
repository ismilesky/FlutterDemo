import '../models/home_movie.dart';
import 'http_config.dart';
import 'http_request.dart';

/// 首页数据请求

class HomeRequest {
  static Future<List<MovieItem>> requestMovieList(int start) async {
    // 1.构建URL
    final movieURL = "https://api.wmdb.tv/api/v1/top?type=Imdb&skip=$start&limit=${RequestConfig.reqCount}&lang=Cn";
    
    // 发送请求
    final result = await HttpRequest.request(movieURL);

    // 转成模型对象
    final subjects = result;
    List<MovieItem> movies = [];
    for (var sub in subjects) {
      movies.add(MovieItem.fromMap(sub));
    }

    return movies;
  }
}