import 'package:favorite_cate/core/viewmodels/base_meal_view_model.dart';

import '../model/meal_model.dart';


class FCFavoriteViewModel extends BaseMealViewModel {


  void addFavoriteMeal(FCMealModel meal) {
    originMeals.add(meal);
    notifyListeners();
  } 
  
  void removeFavoriteMeal(FCMealModel meal) {
    originMeals.remove(meal);
    notifyListeners();
  } 

  void handleMeal(FCMealModel meal) {
    if (isFavorite(meal)) {
      removeFavoriteMeal(meal);
    } else {
      addFavoriteMeal(meal);
    }
  }

  // 是否收藏
  bool isFavorite(FCMealModel meal) {
    return originMeals.contains(meal);
  }

}