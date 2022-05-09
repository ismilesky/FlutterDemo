
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../networks/home_request.dart';
import '../../models/home_movie.dart';
import 'home_movie_list_item.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页Top"),
      ),
      body: Center(
        child: HomeContent(),
      ),
    );
  }
}


class HomeContent extends StatefulWidget {

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {

  int _start = 0;
  List<MovieItem> movies = [];

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   // 数据请求
    _getMovieTopList(true);
  }

  void _getMovieTopList(bool isRefresh) {
    
    var startPage = isRefresh ? 0 : _start + 20;

    // print("startPage:" + startPage.toString());
    HomeRequest.requestMovieList(startPage).then((result) {
      _start = startPage;
      // print(result);
      if (isRefresh) {
        movies = [];
      }
      movies.addAll(result);
      // print(movies);

      if(mounted) {
        setState(() {

        });
      }
    
      _refreshController.refreshCompleted();
    }).catchError((err) {
      print(err);
       _refreshController.loadFailed();
    });
  }

  void _onRefresh() {  // 下拉刷新

   print("_onRefresh");
   _getMovieTopList(true);
      
  }

  void _onLoading() {  // 加载更多
    
    print("_onLoading");

    _getMovieTopList(false);

    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: ClassicHeader(),//WaterDropHeader(),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView.builder(
            itemCount: movies.length,
            itemBuilder: (BuildContext context, int index) {
              var movieItem = movies[index];
              movieItem.rank = (index + 1);
            return HomeMovieListItem(movies[index]);
           },
        )
     );
  }
}


// return ListView.builder(
//       itemCount: movies.length,
//       itemBuilder: (BuildContext context, int index) {
//         return HomeMovieListItem(movies[index]);
//       },
//     );