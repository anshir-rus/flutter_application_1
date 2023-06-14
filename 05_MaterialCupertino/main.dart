// Flutter imports:
import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: "Homework"),
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
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //    key:ScaffoldKey;
      appBar: AppBar(
        title: Text("Homework 5"),
        actions: [
          Builder(
              builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: Icon(Icons.person)))
        ],
      ),
      body: const Center(
        child: Text("My Page!"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 50.0,
                        backgroundImage: NetworkImage(
                            "https://cdn.shopify.com/s/files/1/0732/9120/2876/products/368bc5bd4a8c3608b5d5f02310306ab274dda64a_square3011699_1.webp?v=1678275802"),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Name",
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text("Profile"),
              leading: Icon(Icons.person),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Images"),
              leading: Icon(Icons.satellite),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Files"),
              leading: Icon(Icons.folder_open),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: Row(
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                      child: Text("Регистрация",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Comfortaa-Medium',
                          )),
                      onPressed: () {}),
                  ElevatedButton(
                      child: Text("Выход",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Comfortaa-Medium',
                          )),
                      onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage(
                  "https://cdn.shopify.com/s/files/1/0732/9120/2876/products/368bc5bd4a8c3608b5d5f02310306ab274dda64a_square3011699_1.webp?v=1678275802"),
            ),
            Text('Name')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                height: 120.0,
                child: Column(
                  children: [
                    Row(
                      children: <Widget>[
                        Flexible(
                            flex: 10, // 15%
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              padding: const EdgeInsets.only(top: 10, left: 30),
                              child: Column(
                                children: [Icon(Icons.shopping_cart, size: 20)],
                              ),
                            )),
                        Flexible(
                            flex: 60, // 60%
                            child: Container(
                              padding: const EdgeInsets.only(top: 10, left: 20),
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                children: [
                                  Text('Сумма',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                          fontFamily: 'Comfortaa'))
                                ],
                              ),
                            )),
                        Flexible(
                            flex: 25, // 25%
                            child: Container(
                              padding: const EdgeInsets.only(top: 10),
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                children: [
                                  Text('200 руб.',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                        fontFamily: 'Comfortaa',
                                        fontWeight: FontWeight.bold,
                                      ))
                                ],
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            child: Text("Оплатить",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Comfortaa-Medium',
                                )),
                            onPressed: () {}),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.shop),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: "Photo",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.album),
            label: "Albums",
          ),
        ],
      ),
    );
  }
}
