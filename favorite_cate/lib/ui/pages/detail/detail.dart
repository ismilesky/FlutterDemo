import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/model/meal_model.dart';
import '../../../core/viewmodels/favorite_view_model.dart';
import 'detail_content.dart';


class FCMealDetailScreen extends StatelessWidget {
  static const String routeName = "/detail";

  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)?.settings.arguments as FCMealModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(item.title ?? "详情"),
      ),
      body: FCMealDetailContent(item),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
            colorScheme:
                Theme.of(context).colorScheme.copyWith(secondary: Colors.orangeAccent)),
        child: Consumer<FCFavoriteViewModel>(
          builder: (ctx, favoriteVM, child) {
            final iconData = favoriteVM.isFavorite(item) ? Icons.favorite: Icons.favorite_border;
            final iconColor = favoriteVM.isFavorite(item) ? Colors.red: Colors.black;
            return FloatingActionButton(
                child: Icon(iconData, color: iconColor,), 
                onPressed: () {
                  favoriteVM.handleMeal(item);
                }
            );
          },
        ),
      ),
    );
  }
}
