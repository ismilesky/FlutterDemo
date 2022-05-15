import 'http_request.dart';

import '../model/category_model.dart';

class FCHomeRequest {
  static Future<List<FCCategoryModel>> requestHomeList() async {
    // 1.构建URL
    final homeURL = "/category";
    
    // 发送请求
    final result = await HttpRequest.getRequest(homeURL);

    // 转成模型对象
    final subjects = result["category"];
    List<FCCategoryModel> categories = [];
    for (var sub in subjects) {
      categories.add(FCCategoryModel.fromJson(sub));
    }

    return categories;
  }
}