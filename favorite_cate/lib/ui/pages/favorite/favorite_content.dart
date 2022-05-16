import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/viewmodels/favorite_view_model.dart';
import '../../widgets/meal_item.dart';
import '../tip/no_data.dart';

class FCFavoriteContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

   return Consumer<FCFavoriteViewModel>(
      builder: (ctx, favoriteVM, child) {
        if (favoriteVM.meals.isEmpty) {
           return FCNoDataScreen();
        }
        return  ListView.builder(
          itemCount: favoriteVM.meals.length,
          itemBuilder: (ctx, index) {
            return FCMealItem(favoriteVM.meals[index]);
          },
        );
        
      },
    );
  }
}