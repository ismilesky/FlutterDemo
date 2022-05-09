
/**
https://api.wmdb.tv/api/v1/top?type=Imdb&skip=0&limit=20&lang=Cn
 豆瓣top列表
{
    "data": [
        {
            "createdAt": 1605355459692,
            "updatedAt": 1605355459692,
            "id": "5f968bfcee3680299115bbe6",
            "poster": "https://wmdb.querydata.org/movie/poster/1603701754760-c50d8a.jpg",
            "name": "肖申克的救赎",
            "genre": "犯罪/剧情",
            "description": "20世纪40年代末，小有成就的青年银行家安迪（蒂姆·罗宾斯 Tim Robbins 饰）因涉嫌杀害妻子及她的情人而锒铛入狱。在这座名为鲨堡的监狱内，希望似乎虚无缥缈，终身监禁的惩罚无疑注定了安迪接下来...",
            "language": "英语",
            "country": "美国",
            "lang": "Cn",
            "shareImage": "https://wmdb.querydata.org/movie/poster/1605355459683-5f968bfaee3680299115bb97.png",
            "movie": "5f968bfaee3680299115bb97"
        }
    ],
    "createdAt": 1603701756481,
    "updatedAt": 1603701756481,
    "id": "5f968bfaee3680299115bb97",
    "originalName": "The Shawshank Redemption",
    "imdbVotes": 2297852,
    "imdbRating": "9.3",
    "rottenRating": "91",
    "rottenVotes": 75,
    "year": "1994",
    "imdbId": "tt0111161",
    "alias": "月黑高飞(港) / 刺激1995(台) / 地狱诺言 / 铁窗岁月 / 消香克的救赎",
    "doubanId": "1292052",
    "type": "Movie",
    "doubanRating": "9.7",
    "doubanVotes": 2170679,
    "duration": 8520,
    "dateReleased": "1994-09-10"
}
 */

class MovieData {
   String? poster;
   String? name;
   String? genre;
   String? description;
   String? language;
   MovieData.fromMap(Map<String, dynamic> json) {
    poster = json["poster"];
    name = json["name"];
    genre = json["genre"];
    description = json["description"];
    language = json["language"];
  }
}


int counter = 1;

class MovieItem {
  int? rank;
  MovieData? data;
  String? playDate;
  String? rating;
 
  String? originalTitle;

  MovieItem.fromMap(Map<String, dynamic> json) {
    // rank = counter++;
    data = MovieData.fromMap(json["data"][0]);

    playDate = json["year"];
    rating = json["doubanRating"];
    originalTitle = json["originalName"];
  }

  @override
  String toString() {
    // TODO: implement toString
    return data?.name  ?? "" ;
  }
}