import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/home/DaliyPage.dart';
import 'package:flutter_app/home/FindPage.dart';
import 'package:flutter_app/home/RecommendPage.dart';
import 'package:flutter_app/utils/Adapt.dart';
import 'package:flutter_app/weiget/RoundUnderlineTabIndicator.dart';

/**
 * 首页
 */
class FristPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new FristPagePageState();
}

class FristPagePageState extends State<FristPage>
    with SingleTickerProviderStateMixin {
  var tabList = <Tab>[
    Tab(
      text: "发现",
    ),
    Tab(
      text: "推荐",
    ),
    Tab(
      text: "日报",
    )
  ];
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: tabList.length,
      vsync: this, //动画效果的异步处理，默认格式，背下来即可
    );
//    _controller.addListener((){
//      print(_controller.toString());
//      print(_controller.index);
//      print(_controller.length);
//      print(_controller.previousIndex);
//    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,

     child: MaterialApp(

        home: Scaffold(
      appBar:PreferredSize(child:   AppBar(
        centerTitle: true,
        elevation:0.0,
        backgroundColor: Colors.white,
        title: Container(
          child: TabBar(
            indicator: RoundUnderlineTabIndicator(
                borderSide: BorderSide(width: 3.5, color: Color(0xeeeeeeee))),
            tabs: tabList,
            controller: _controller,
            //配置控制器
            isScrollable: true,
            labelColor: Colors.black,
            labelStyle: TextStyle(
              fontSize: 18.0,
            ),
            unselectedLabelColor: Color.fromRGBO(192, 192, 192, 100),
            unselectedLabelStyle:
            TextStyle(fontSize: 15.0, color: Color(0x000000)),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
          )
        ],
        leading: Builder(builder: (BuildContext context) {
          return IconButton(icon:   Icon(Icons.date_range), onPressed: () {});
        }),
      ),preferredSize: Size.fromHeight(Adapt.px(120))),

      body: TabBarView(
        controller: _controller, //配置控制器
        children: <Widget>[FindPage(), new  RecommendPage(), DaliyPage()],
      ),
    )));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
