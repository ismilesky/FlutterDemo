import 'package:cached_network_image/cached_network_image.dart';
import 'package:favorite_cate/ui/pages/detail/detail.dart';
import 'package:flutter/material.dart';

import 'package:favorite_cate/core/extension/int_extension.dart';
import 'package:favorite_cate/core/model/meal_model.dart';
import 'package:favorite_cate/ui/widgets/bottom_opt.dart';
import 'package:favorite_cate/core/extension/double_extension.dart';
import 'package:provider/provider.dart';

import '../../core/viewmodels/favorite_view_model.dart';

class FCMealItem extends StatelessWidget {
  final FCMealModel _mealModel;

  FCMealItem(this._mealModel);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(10.px),
        elevation: 10,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.px)),
        child: Column(
          children: [_buildTopInfo(context), _buildBottomOpt()],
        ),
      ),
      onTap: () {
        Navigator.of(context)
            .pushNamed(FCMealDetailScreen.routeName, arguments: _mealModel);
      },
    );
  }

  Widget _buildTopInfo(BuildContext context) {
    return Stack(children: [
      ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.px),
            topRight: Radius.circular(12.px),
          ),
          child: CachedNetworkImage(
            imageUrl: _mealModel.imageUrl ?? "",
            placeholder: (context, url) => Container(
                width: 120.px,
                height: 60.px,
                child: Center(
                  child: CircularProgressIndicator(),
                )),
            errorWidget: (context, url, error) => Icon(Icons.error),
            width: double.infinity,
            height: 250.px,
            fit: BoxFit.cover,
          )

          //  Image.network(
          //    _mealModel.imageUrl ?? "",
          //     width: double.infinity,
          //     height: 250.px,
          //     fit: BoxFit.cover,
          //  ),
          ),
      Positioned(
        right: 10.px,
        bottom: 10.px,
        child: Container(
          width: 300.px,
          padding: EdgeInsets.symmetric(horizontal: 10.px, vertical: 5.px),
          decoration: BoxDecoration(
              color: Colors.black54, borderRadius: BorderRadius.circular(6.px)),
          child: Text(
            _mealModel.title ?? "",
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: Colors.white),
          ),
        ),
      ),
    ]);
  }

  Widget _buildBottomOpt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FCOperationItem(Icon(Icons.schedule), "${_mealModel.duration}分钟"),
        FCOperationItem(Icon(Icons.restaurant), _mealModel.complexStr),
        _buildFavoriteInfo()
      ],
    );
  }

  Widget _buildFavoriteInfo() {
    return Consumer<FCFavoriteViewModel>(
      builder: (ctx, favoriteVM, child) {
        final iconData = favoriteVM.isFavorite(_mealModel)
            ? Icons.favorite
            : Icons.favorite_border;
        final iconColor =
            favoriteVM.isFavorite(_mealModel) ? Colors.red : Colors.black;
        final text = favoriteVM.isFavorite(_mealModel) ? "已收藏" : "未收藏";
        return GestureDetector(
          child: FCOperationItem(
            Icon(iconData, color: iconColor,), text),
            onTap: () {
              favoriteVM.handleMeal(_mealModel);
            },
        );
      },
    );
  }
}
