import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/viewmodels/favorite_view_model.dart';
import '../../widgets/meal_item.dart';

class FCFavoriteContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   print('FCFavoriteContent build');

   return Consumer<FCFavoriteViewModel>(
      builder: (ctx, favoriteVM, child) {

        print('Consumer<FCFavoriteViewModel> 刷新数据');
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