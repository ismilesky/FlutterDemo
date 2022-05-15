import '../model/meal_model.dart';
import 'http_request.dart';



class FCMealRequest {
  static Future<List<FCMealModel>> requestMealList() async {
    // 1.构建URL
    final homeURL = "/meal";
    
    // 发送请求
    final result = await HttpRequest.getRequest(homeURL);

    // print(result);

    // 转成模型对象
    final subjects = result["meal"];
    List<FCMealModel> meals = [];
    for (var sub in subjects) {
      meals.add(FCMealModel.fromJson(sub));
    }

    return meals;
  }
}