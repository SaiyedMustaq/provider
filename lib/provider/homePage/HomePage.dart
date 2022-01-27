import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/provider/homePage/pages/MainPage.dart';
import 'package:provider_app/provider/homePage/pages/ProfilePage.dart';
import 'package:provider_app/provider/homePage/pages/SettingPage.dart';

import 'bottomnavigationProvider/BottomNavigationProvider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentTab = [
    const MainPage(),
    const ProfilePage(),
    const SettingPage(),
  ];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
      body: currentTab[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: provider.currentIndex,
        onTap: (index) {
          provider.currentIndex = index;
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          )
        ],
      ),
    );
  }
}
