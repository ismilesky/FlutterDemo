import 'package:flutter/material.dart';

import '../../../core/model/category_model.dart';
import '../../../core/extension/int_extension.dart';
import '../../../core/services/json_parse.dart';
import '../meal/meal.dart';

class HomeContent extends StatefulWidget {
  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List<FCCategoryModel> _categories = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 数据请求
    FCJsonParse.getCategoryData().then((result) {
      setState(() {
        _categories = result;
      });
    });
  }

  Widget _getItems(ctx, index) {
    final item = _categories[index];

    return GestureDetector(
      child: Container(
          decoration: BoxDecoration(
              color: item.finalColor,
              borderRadius: BorderRadius.circular(12.px),
              gradient: LinearGradient(
                  colors: [item.finalColor.withOpacity(.5), item.finalColor])),
          alignment: Alignment.center,
          child: Text(
            item.title ?? "",
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontWeight: FontWeight.bold),
          )
        ),
        onTap: () {
          Navigator.of(context).pushNamed(FCMealScreen.routeName, arguments: item);
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(20.px),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 交叉轴的item个数
          crossAxisSpacing: 20.px, // 交叉轴的间距 竖向
          mainAxisSpacing: 20.px, // 主轴的间距 横向
          childAspectRatio: 1.5 // 宽高比
          ),
      itemCount: _categories.length,
      itemBuilder: _getItems,
    );
  }
}

class HomeContentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // FutureBuilder 相对来说更加适用于数据不怎么改变的界面,具体看使用场景
    return FutureBuilder<List<FCCategoryModel>>(
      future: FCJsonParse.getCategoryData(),
      builder: (ctx, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        if (snapshot.error != null)
          return Center(
            child: Text("请求失败"),
          );

        final categories = snapshot.data as List<FCCategoryModel>;
        return GridView.builder(
            padding: EdgeInsets.all(20.px),
            itemCount: categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.px,
                mainAxisSpacing: 20.px,
                childAspectRatio: 1.5),
            itemBuilder: (ctx, index) {
              final item = categories[index];

              return Container(
                  decoration: BoxDecoration(
                      color: item.finalColor,
                      borderRadius: BorderRadius.circular(12.px),
                      gradient: LinearGradient(colors: [
                        item.finalColor.withOpacity(.5),
                        item.finalColor
                      ])),
                  alignment: Alignment.center,
                  child: Text(
                    item.title ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ));
            }
        );
      },
    );
  }
}
