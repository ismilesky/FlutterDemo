
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';


import '../../../core/model/category_model.dart';
import 'package:favorite_cate/core/model/meal_model.dart';
import 'package:favorite_cate/core/viewmodels/meal_view_model.dart';
import 'package:favorite_cate/ui/widgets/meal_item.dart';

import '../tip/no_data.dart';

class FCMealContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final item = ModalRoute.of(context)?.settings.arguments as FCCategoryModel;

    return Selector<FCMealViewModel, List<FCMealModel>>(

      selector: (ctx, mealVM) {
        return mealVM.meals.where((meal) {
          return meal.categories!.contains(item.id);
        }).toList();
      },
      shouldRebuild: (prev, next) => !ListEquality().equals(prev, next),
      builder: (ctx, meals, child) {

        if (meals.isEmpty) {
           return FCNoDataScreen();
        }

        return ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) {
            return FCMealItem(meals[index]);
          },
        );
      },
    );

  }
}