
import 'package:favorite_cate/core/services/meal_request.dart';
import 'package:favorite_cate/core/viewmodels/base_meal_view_model.dart';

class FCMealViewModel extends BaseMealViewModel {
  
  FCMealViewModel() {
    FCMealRequest.requestMealList().then((result) {
      meals = result;
    });
  }
}