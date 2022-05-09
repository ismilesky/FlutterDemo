import 'package:flutter/material.dart';

import '../../components/dashed_line.dart';
import '../../components/rate_star.dart';
import '../../models/home_movie.dart';


class HomeMovieListItem extends StatelessWidget {
  final MovieItem movie;

  HomeMovieListItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 10, color: Color(0xffe2e2e2)))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 1.电影排名
          _getMovieRankWidget(),
          SizedBox(height: 12),
          // 2.具体内容
          _getMovieContentWidget(),
          SizedBox(height: 12),
          // 3.电影简介
          _getMovieIntroduceWidget(),
          SizedBox(height: 12,)
        ],
      ),
    );
  }

  // 电影排名
  Widget _getMovieRankWidget() {
    return Container(
      padding: EdgeInsets.fromLTRB(9, 4, 9, 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Color.fromARGB(255, 238, 205, 144)
      ),
      child: Text(
        "No.${movie.rank}",
        style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 131, 95, 36)),
      )
    );
  }

  // 具体内容
  Widget _getMovieContentWidget() {
    return Container(
      height: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _getContentImage(),
          _getContentDesc(),
          _getDashLine(),
          _getContentWish()
        ],
      ),
    );
  }

  Widget _getContentImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.network(movie.data?.poster ?? "")
    );
  }

  Widget _getContentDesc() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _getTitleWidget(),
            SizedBox(height: 3,),
            _getRatingWidget(),
            SizedBox(height: 3,),
            _getInfoWidget()
          ],
        ),
      ),
    );
  }

  Widget _getDashLine() {
    return Container(
      width: 1,
      height: 100,
      child: DashedLine(
        axis: Axis.vertical,
        dashedHeight: 6,
        dashedWidth: .5,
        count: 12,
      ),
    );
  }

  Widget _getTitleWidget() {
    var name = movie.data?.name ?? "";
    return Stack(
      children: <Widget>[
        Icon(Icons.play_circle_outline, color: Colors.redAccent,),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "     " + name,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                )
              ),
              TextSpan(
                text: "(${movie.playDate})",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54
                ),
              )
            ]
          ),
          maxLines: 2,
        ),
      ],
    );
  }

  Widget _getRatingWidget() {

    var rate = "9";
    if (movie.rating != null && !movie.rating!.isEmpty) {
      rate = movie.rating!;
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        RateStar(rating: double.parse(rate), size: 18,),
        SizedBox(width: 5),
        Text("${movie.rating}")
      ],
    );
  }

  Widget _getInfoWidget() {
    // 1.获取种类字符串
    // final genres = movie.genres.join(" ");

   final genres = movie.data?.genre ?? "";

    // final director = movie.director.name;
    // var castString = "";
    // for (final cast in movie.casts) {
    //   castString += cast.name + " ";
    // }

    // 2.创建Widget
    return Text(
      // "$genres / $director / $castString",
     "$genres",

      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 16),
    );
  }

  Widget _getContentWish() {
    return Container(
      width: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20,),
          Image.asset("images/home/wish.png", width: 30,),
          SizedBox(height: 5,),
          Text(
            "想看",
            style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 235, 170, 60)),
          )
        ],
      ),
    );
  }

  // 电影简介（原生名称）
  Widget _getMovieIntroduceWidget() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xfff2f2f2),
        borderRadius: BorderRadius.circular(5)
      ),
      child: Text( (movie.data?.description ?? ""), style: TextStyle(fontSize: 18, color: Colors.black54),),
    );
  }
}
