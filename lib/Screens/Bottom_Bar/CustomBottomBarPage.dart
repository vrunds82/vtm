import 'package:flutter/material.dart';
import 'package:vtm/Screens/Global_File/GlobalFile.dart';
import 'package:vtm/Screens/History_Screen/HistoryScreen.dart';
import 'package:vtm/Screens/InfoScreen/Info_page.dart';
import 'package:vtm/Screens/MusicPlayer_Home/VtmHome.dart';
import 'package:vtm/Screens/Youtube_Videos/YoutubeVideo_Screen.dart';

class BottomBarScreen extends StatefulWidget {
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  @override
  Widget build(BuildContext context) {

    List<Widget> pageName = [
      InfoScreen(),
      VtmHomePage(),
      Youtubevidepage(),
      HistoryPage(),
      VtmHomePage(),
    ];

    return Scaffold(
    bottomNavigationBar: CustomBottomBar(click: (){
      refreshScreen();
    },),
    body: pageName[Global.currentPageIndex],
    );
  }

  refreshScreen(){
    setState(() {
    });
  }

}
