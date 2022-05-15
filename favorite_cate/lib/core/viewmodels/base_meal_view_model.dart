
import 'package:flutter/material.dart';

import '../model/meal_model.dart';
import 'filter_view_model.dart';

class BaseMealViewModel extends ChangeNotifier {
   List<FCMealModel> _meals = [];

  late FCFilterViewModel _filterVM;
  
  // 产生依赖
  void updateFilters(FCFilterViewModel filterVM) {
    _filterVM = filterVM;
    notifyListeners();
  }

  // 过滤
  List<FCMealModel> get meals {
    return 
    _meals.where((meal) {
      if (_filterVM.isGlutenFree && !meal.isGlutenFree!) return false;
      if (_filterVM.isLactoseFree && !meal.isLactoseFree!) return false;
      if (_filterVM.isVegetarian && !meal.isVegetarian!) return false;
      if (_filterVM.isVegan && !meal.isVegan!) return false;
      return true;
    }).toList();
  }

  // 原始
  List<FCMealModel> get originMeals {
    return _meals;
  }

  set meals(List<FCMealModel> value) {
    _meals = value;
    notifyListeners();
  }
}