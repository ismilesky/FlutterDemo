
import 'package:favorite_cate/core/extension/int_extension.dart';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/model/meal_model.dart';
import '../../widgets/preview_image.dart';

class FCMealDetailContent extends StatelessWidget {
  final FCMealModel _meal;

  FCMealDetailContent(this._meal);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildTopImage(context),
          _buildTitle(context, "制作材料"),
          _buildMeterial(context),
          _buildTitle(context, "步骤"),
          _buildSteps(context)
        ],
      ),
      
    );
  }



  // 图片
  Widget _buildTopImage(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        child: CachedNetworkImage(
               imageUrl: _meal.imageUrl ?? "",
               placeholder: (context, url) => Container(
                  width: 120.px,
                  height: 60.px,
                  child: Center(
                    child: CircularProgressIndicator(),
                  )),
               errorWidget: (context, url, error) => Icon(Icons.error),
               fit: BoxFit.cover,
             ),
      ),
      onTap: () {
         Navigator.push(context, PageRouteBuilder(
                pageBuilder: (context, anim1, anim2) {
                  return FadeTransition(
                    opacity: anim1,
                    child: PictureOverview(
                      imageItems: [_meal.imageUrl],
                    )
                  );
                },
          ));
      },
    );
  }

  // 标题
  Widget _buildTitle(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.px),
      child: Text(title, style: Theme.of(context).textTheme.headline6?.copyWith(fontWeight: FontWeight.bold),),
    );
  }


  /**
   Container包裹ListView报错:
   ════════ Exception caught by rendering library ═════════════════════════════════
       RenderBox was not laid out: RenderViewport#a70ba NEEDS-LAYOUT NEEDS-PAINT NEEDS-COMPOSITING-BITS-UPDATE
      'package:flutter/src/rendering/box.dart':
       package:flutter/…/rendering/box.dart:1
       Failed assertion: line 1982 pos 12: 'hasSize'

    ListView会默认尽可能大撑起父视图，引起约束冲突，设置下面属性
     shrinkWrap: true,
     physics: NeverScrollableScrollPhysics(),
   */
  /** */
  
  // 制作材料
  Widget _buildMeterial(BuildContext context) {
    return _buildMakeContent(
      context: context,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _meal.ingredients?.length,
        itemBuilder: (ctx, index) {
          return Card(
            color: Colors.orangeAccent,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.px, horizontal: 10.px),
              child: Text(_meal.ingredients?[index] ?? "暂无"),
            ),
          );
        }
      ),
    );
  }

  Widget _buildMakeContent({BuildContext? context, Widget? child}) {
    return Container(
      padding: EdgeInsets.all(8.px),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.px)
      ),
      width: MediaQuery.of(context!).size.width - 30.px,
      child: child,
    );
  }

  // 步骤
  Widget _buildSteps(BuildContext context) {
    return _buildMakeContent(
      context: context,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _meal.steps != null ? _meal.steps!.length : 1,
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text("#${index+1}"),
            ),
            title: Text(_meal.steps?[index] ?? "暂无"),
          ); 
        },
        separatorBuilder: (ctx, index) {
          return Divider();
        }, 
      )
    );
  }
}