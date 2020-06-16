import 'package:flutter/material.dart';
import 'package:flutter_app/home/CoursePage.dart';
import 'package:flutter_app/home/FristPage.dart';
import 'package:flutter_app/weiget/NavigationIconView.dart';

/**
 * 主页
 */
class HomePage extends StatefulWidget {
  static const String routeName = '/material/bottom_navigation';

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int currentIndex = 0;
  BottomNavigationBarType type = BottomNavigationBarType.shifting;
  List<NavigationIconView> navigaViews;

  var body;
  List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
    navigaViews = <NavigationIconView>[
      NavigationIconView(activeIcon: const Icon(Icons.account_balance),
          icon: const Icon(Icons.access_alarm),
          title: '首页',
          color: new Color.fromARGB(255, 0, 215, 198),
          vsync: this),
      NavigationIconView(activeIcon: const Icon(Icons.business),
          icon: const Icon(Icons.business_center),
          title: '社区',
          color: new Color.fromARGB(255, 0, 215, 198),
          vsync: this),
      NavigationIconView(activeIcon: const Icon(Icons.cloud),
          icon: const Icon(Icons.cloud_queue),
          title: '通知',
          color: new Color.fromARGB(255, 0, 215, 198),
          vsync: this),
      NavigationIconView(activeIcon: const Icon(Icons.accessibility),
          icon: const Icon(Icons.account_box),
          title: '我的',
          color: new Color.fromARGB(255, 0, 215, 198),
          vsync: this)
    ];
    for(NavigationIconView view in navigaViews)
      view.controller.addListener(rebuild);
    navigaViews[currentIndex].controller.value =1.0;
  }

  @override
  void dispose() {
    for (NavigationIconView view in navigaViews) view.controller.dispose();
    super.dispose();
  }
  void initData(){
    body = new IndexedStack(
      children: <Widget>[
        new FristPage(),
        new WechatPage(),
        new WechatPage(),
        new WechatPage()
      ],
      index: currentIndex,
    );
  }

  void rebuild() {
    setState(() {
      // Rebuild in order to animate views.
    });
  }
  @override
  Widget build(BuildContext context) {
    initData();
    final BottomNavigationBar botbar = BottomNavigationBar(
      items: navigaViews.map((NavigationIconView navigaView) => navigaView.item).toList(),
      currentIndex: currentIndex,
      type: type,
      onTap: (int index){
        setState(() {
          navigaViews[currentIndex].controller.reverse();
          currentIndex = index;
          navigaViews[currentIndex].controller.forward();
        });
      },
    );

    return Scaffold(
    body: body,
    bottomNavigationBar: botbar,);
  }
}
