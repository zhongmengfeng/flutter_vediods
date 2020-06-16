
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';

/**
 * 推荐
 * https://dss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1035415831,1465727770&fm=26&gp=0.jpg
 */
class RecommendPage extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10.0),
          child: Swiper(
            outer: false,
            itemBuilder: (c,j){

            },
          ),
        )
      ],
    );
  }

  @override
  State<StatefulWidget> createState() {
    return new _RecState();
  }
}

class _RecState extends State<RecommendPage> {
  List listData;
  List swiperDataList=["https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562723625662&di=bc7be59dd27706ea65ea33a94c209477&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F12%2F40%2F43%2F18958PICYpQ.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562723734494&di=864f7b85f900f0b68e8bc08f1c078eed&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201511%2F02%2F20151102140204_WUSwE.jpeg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562723821634&di=e04d14690229411a560ccc6cf0e10f6a&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F15%2F01%2F96%2F56N58PICVWw_1024.jpg"];
  void _loadData() async {
//    var result = await YFHttp.request('/v2/movie/in_theaters',
//        data: {
//          'apikey': "0b2bdeda43b5688921839c8ecb20399b",
//        },
//        method: YFHttp.GET);
//    setState(() {
//      listData = result['subjects'];
//    });
  }

  @override
  void initState() {
    this._loadData();
    super.initState();
  }

  Widget _getItems(context, index) {
    if (listData.length > 0) {
      return ListTile(
          title: Text(listData[index]["title"]),
          subtitle: Text(listData[index]["mainland_pubdate"]),
          leading:  CachedNetworkImage(
            imageUrl: "${listData[index]['images']['small']}",
            placeholder: (context, url) => new CircularProgressIndicator(),
            errorWidget: (context, url, error) => new Icon(Icons.error),
            fit: BoxFit.fill,
          )
      );
    } else {
      return ListTile();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ConstrainedBox(
              child: Swiper(
                outer: false,
                itemBuilder: (c, i) {
                  if(swiperDataList!=null){
                    return CachedNetworkImage(
                      imageUrl: "${swiperDataList[i]}",
                      placeholder: (context, url) => new CircularProgressIndicator(),
                      errorWidget: (context, url, error) => new Icon(Icons.error),
                    );
                  }
                },
                pagination:
                new SwiperPagination(margin: new EdgeInsets.all(5.0)),
                itemCount: swiperDataList == null ? 0 : swiperDataList.length,
              ),
              constraints:
              new BoxConstraints.loose(new Size(MediaQuery.of(context).size.width, 180.0))),
          Expanded(
            child:  ListView.builder(
                itemCount: listData == null ? 0 : listData.length,
                itemBuilder: this._getItems),
          )
        ],
      ),
    );
  }

}
