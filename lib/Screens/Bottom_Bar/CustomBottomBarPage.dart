import 'package:flutter/material.dart';
import 'package:vtm/Screens/Global_File/GlobalFile.dart';
import 'package:vtm/Screens/MusicPlayer_Home/VtmHome.dart';

class BottomBarScreen extends StatefulWidget {
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  @override
  Widget build(BuildContext context) {

    List<Widget> pageName = [

      VtmHomePage(),
      VtmHomePage(),
      VtmHomePage(),
      VtmHomePage(),
      VtmHomePage(),
    ];

    return Scaffold(
    bottomNavigationBar: CustomBottomBar(),
    body: pageName[Global.currentPageIndex],
    );
  }
}
