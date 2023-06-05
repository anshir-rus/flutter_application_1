// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
//import 'package:carousel_slider/carousel_slider.dart';
//import 'package:flutter_svg/flutter_svg.dart';
//import 'package:image/image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Homework'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const List<Tab> nav = <Tab>[
    Tab(text: 'Мои фото'),
    Tab(text: 'Галерея'),
  ];

  Map<String, dynamic> data = {
    'Мои фото': [
      'https://i.playground.ru/p/b3maElnqbqKML4iPxGJ3_g.jpeg',
      'https://assets.change.org/photos/8/yu/hu/GuYuhumfnTiWegH-1600x900-noPad.jpg?1484048650',
      'https://bookflow.ru/wp-content/uploads/2022/10/102-zadachi-na-logiku-smekalku-i-soobrazitelnost-s-otvetami.jpg',
      'https://media.24h.tv/img/f6/d0/f6d01421e497558a10a8e37426cb7299.jpeg?w=1080',
      'https://www.youmeg.com/wp-content/uploads/2021/12/IMG_20211211_152318.jpg',
      'https://cartacuentos.es/wp-content/uploads/2019/11/lectura-y-fracaso-escolar.jpg',
      'https://media.24h.tv/img/3b/31/3b31c48f543ba3dd29bff1eafeda2cec.jpeg?w=1080',
      'https://i.pinimg.com/originals/6a/82/5b/6a825b59802fcb905c6aeba134a0f5e2.jpg',
      'https://cdn-ru.bitrix24.kz/b3421115/landing/61d/61d8ea499d36f5cf0251df55c03a3d98/Oplata_kartoy_new_2x.jpg',
      'https://avatars.dzeninfra.ru/get-zen_brief/7227031/pub_62bfbeb86437692bc851aa84_62bfbef98891784cf0a83cc3/scale_1200',
    ],
    'Галерея': [
      'https://assets.change.org/photos/4/wt/tn/CkwTtNSQJikfOgy-1600x900-noPad.jpg?1610301677',
      'https://translationoutlet.com/blog/wp-content/uploads/2020/11/traducciones-tecnicas-20201103-01.jpg',
      'https://cdn-ru.bitrix24.ru/b10485279/landing/35b/35baf8d3242733da8f32fbae67e3db98/testirovshchik_gr_kaver_2x.png',
      'https://gazeta13.ru/data/photo/103118_040335059297.jpg',
      'https://cdn-ru.bitrix24.ru/b18208716/landing/5d0/5d05906253bfefccaddc6ef0155122f7/Group_isk_sud_2x.jpg',
      'https://sun9-41.userapi.com/impf/6fMe9YrwPfALSRaf-H3aI3XWBjzd56ZC3fda0g/oWICZ6IN-54.jpg?size=1280x800&quality=96&sign=b7f861645da9c7305f1dc73b11bf8e87&c_uniq_tag=dZ7Xt7WzCU_AmBziZGoXrDZObSByg-1yH0l9m67McMM&type=album',
      'https://sun9-29.userapi.com/impg/caPQB_rXMrBIYd5eWrYyZ6l6QD9r0xPHN3xAdA/T_PakpJgOGc.jpg?size=1080x607&quality=96&sign=bc31d18813f3a61441c272fe2a9938d3&c_uniq_tag=3TkRCrX7X7rfJZkKAfNaHCfzY1m85vOKKkWfV66cWiE&type=album',
      'https://sun9-28.userapi.com/impg/kXmCJ2yDwM7z9s1rSDzrfGfsU7kE8WfL_iLJgw/Kr9iS70eMfw.jpg?size=1080x607&quality=96&sign=4f637f2727c533207fa4b3acb25f48cf&c_uniq_tag=P4EBC3zqtwT9h65Elew5F7gSPgkw8IFtzF6D4VgLDwQ&type=album',
      'https://www.mingre.com/wp-content/uploads/2018/09/61d12c7e5e4146f8ee0c799a36b32d6f.jpg',
      'https://cdn.wallpaperinhd.net/wp-content/uploads/2018/11/06/Michael-Jordan-Wallpaper-32.jpg',
    ]
  };

  List pictures(tab) {
    List newlist = [];

    for (final MapEntry<String, dynamic> element in data.entries) {
      if (element.key == tab) {
        for (final values in element.value) {
          newlist.add(values);
        }
      }
    }
    return newlist;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: nav.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: const TabBar(
            tabs: nav,
          ),
        ),
        body: TabBarView(
          children: nav.map((Tab tab) {
            return ListView.builder(
                key: PageStorageKey(tab),
                itemCount: pictures(tab.text).length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Column(
                      children: [
                        Image.network(pictures(tab.text)[index].toString())
                      ],
                    ),
                  );
                });
          }).toList(),
        ),
      ),
    );
  }
}
