

import 'package:flutter/material.dart';

class RateStar extends StatefulWidget {
  final double rating; // 评分
  final double maxRating; // 最大分数
  final Widget unselectedImage;
  final Widget selectedImage;
  final int count; // 个数
  final double size; // 大熊啊
  final Color unselectedColor; // 未选中颜色
  final Color selectedColor; // 选中颜色

  RateStar({
    required this.rating, 
    this.maxRating = 10, 
    this.count = 5, 
    this.size = 30, 
    this.unselectedColor = const Color(0xffbbbbbb), 
    this.selectedColor = const Color(0xffe0aa46),
    Widget? unselectedImage, 
    Widget? selectedImage}):
    assert(rating < maxRating), // 避免评分大于最大分值
     unselectedImage = unselectedImage ?? Icon(Icons.star, size: size, color: unselectedColor,),
     selectedImage = selectedImage ?? Icon(Icons.star, size: size, color: selectedColor);

  @override
  State<RateStar> createState() => _RateStarState();
}

class _RateStarState extends State<RateStar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Row(children: getUnSelectImage(), mainAxisSize: MainAxisSize.min),
          Row(children: getSelectImage(), mainAxisSize: MainAxisSize.min),
        ],
      ),
    );
  }
   
   // 获取评星
  List<Widget> getUnSelectImage() {
    return List.generate(widget.count, (index) => widget.unselectedImage);
  }

  List<Widget> getSelectImage() {
    List<Widget> selectedStars = [];

    // 计算Star个数和剩余比例等
    // 构建满填充的star
    // 一个star的的占比
    double oneValue = widget.maxRating / widget.count;
    // star的个数  下取整  eg: 4.5  先填充4个star,再填充0.5个star
    int entireCount = (widget.rating / oneValue).floor(); 

    for (int i = 0; i < entireCount; i++) {
      selectedStars.add(widget.selectedImage);
    }

    // 构建部分填充的star
    // 部分star的宽度
    double leftWidth = ((widget.rating / oneValue) - entireCount) * widget.size;
    // 裁剪之后star
    Widget leftStar = ClipRect(
      clipper: StarRectClipper(leftWidth),
      child: widget.selectedImage,
    );
    selectedStars.add(leftStar);
    return selectedStars;
  }
}


/// 对选中的最后一个star进行裁剪 
/// 定义CustomClipper裁剪规则
class StarRectClipper extends CustomClipper<Rect> {
  final double width;

  StarRectClipper(this.width);
  
  @override
  Rect getClip(Size size) { // 获取裁剪区域
    // TODO: implement getClip
    return Rect.fromLTWH(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(StarRectClipper oldClipper) { // 是否重新裁剪
    // TODO: implement shouldReclip
    return width != oldClipper.width;
  }
  
}