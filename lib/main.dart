import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        drawerTheme: const DrawerThemeData(scrimColor: Colors.transparent),
      ),
      title: 'New Whatsapp',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _globalKey,
        backgroundColor: const Color(0xFF171717),
        body: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          _globalKey.currentState!.openDrawer();
                        },
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                      const IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 10),
                    children: const [
                      TextButton(
                          onPressed: null,
                          child: Text(
                            'Messages',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          )),
                      SizedBox(
                        width: 35,
                      ),
                      TextButton(
                          onPressed: null,
                          child: Text(
                            "Online",
                            style: TextStyle(color: Colors.grey, fontSize: 24),
                          )),
                      SizedBox(
                        width: 35,
                      ),
                      TextButton(
                          onPressed: null,
                          child: Text(
                            "Groups",
                            style: TextStyle(color: Colors.grey, fontSize: 24),
                          )),
                      SizedBox(
                        width: 35,
                      ),
                      TextButton(
                          onPressed: null,
                          child: Text(
                            "More",
                            style: TextStyle(color: Colors.grey, fontSize: 24),
                          )),
                      SizedBox(
                        width: 35,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: 120,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.only(top: 15, left: 25, right: 25),
                height: 220,
                decoration: const BoxDecoration(
                  color: Color(0xFF27c1a9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Favorite Contacts",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.more_horiz,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 95,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          buildContactAvatar('Alla', 'img1.jpeg'),
                          buildContactAvatar('July', 'img2.jpeg'),
                          buildContactAvatar('Mikle', 'img3.jpeg'),
                          buildContactAvatar('Kler', 'img4.jpg'),
                          buildContactAvatar('Moane', 'img5.jpeg'),
                          buildContactAvatar('Julie', 'img6.jpeg'),
                          buildContactAvatar('Allen', 'img7.jpeg'),
                          buildContactAvatar('John', 'img8.jpg'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 300,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: const BoxDecoration(
                    color: Color(0xFFEFFFFC),
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    children: [
                      buildConversationRow(
                        'Laura',
                        'Hello, how are you',
                        'img1.jpeg',
                        3,
                      ),
                      buildConversationRow(
                          'Kalya', 'Will you visit me', 'img2.jpeg', 2),
                      buildConversationRow(
                          'Mary', 'I ate your ...', 'img3.jpeg', 6),
                      buildConversationRow(
                          'Hellen', 'Are you with Kayla again', 'img5.jpeg', 0),
                      buildConversationRow(
                          'Louren', 'Barrow money please', 'img6.jpeg', 3),
                      buildConversationRow(
                          'Tom', 'Hey, whatsup', 'img7.jpeg', 0),
                      buildConversationRow(
                          'Laura', 'Helle, how are you', 'img1.jpeg', 0),
                      buildConversationRow(
                          'Laura', 'Helle, how are you', 'img1.jpeg', 0),
                    ]),
              ),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xFF27C1A9),
          child: const Icon(
            Icons.edit_outlined,
            size: 30,
            color: Colors.white,
          ),
        ),
        drawer: Drawer(
            width: 275,
            elevation: 30,
            backgroundColor: const Color(0xF3393838),
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.horizontal(right: Radius.circular(40))),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.horizontal(right: Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x3D000000),
                      spreadRadius: 30,
                      blurRadius: 20)
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(
                              width: 56,
                            ),
                            Text(
                              'Settings',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            UserAvatar(filename: 'img7.jpeg'),
                            SizedBox(width: 12),
                            Text(
                              'Tom Brenan',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        DrawerItem(title: 'Account', icon: Icons.key),
                        DrawerItem(title: 'Chats', icon: Icons.chat_bubble),
                        DrawerItem(
                            title: 'Notifications', icon: Icons.notifications),
                        DrawerItem(
                            title: 'Data and Storage', icon: Icons.storage),
                        DrawerItem(title: 'Help', icon: Icons.help),
                        Divider(
                          height: 35,
                          color: Colors.green,
                        ),
                        DrawerItem(
                            title: 'Invite a friend',
                            icon: Icons.people_outline),
                      ],
                    ),
                    DrawerItem(title: 'Log out', icon: Icons.logout),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  Column buildConversationRow(
      String name, String message, String filename, int msgCount) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                UserAvatar(filename: filename),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      message,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [
                const Text(
                  '16:35',
                  style: TextStyle(fontSize: 10),
                ),
                const SizedBox(height: 12),
                if (msgCount > 0)
                  CircleAvatar(
                    radius: 7,
                    backgroundColor: const Color(0xFF27c1a9),
                    child: Text(
                      msgCount.toString(),
                      style: const TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  )
              ],
            )
          ],
        ),
        const Divider(indent: 70)
      ],
    );
  }

  Padding buildContactAvatar(String name, String filename) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Column(
        children: [
          UserAvatar(filename: filename),
          const SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  const DrawerItem({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: null,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(
              width: 40,
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UserAvatar extends StatelessWidget {
  final String filename;
  const UserAvatar({
    super.key,
    required this.filename,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 32,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 29,
        backgroundImage: Image.asset('assets/images/$filename').image,
      ),
    );
  }
}
