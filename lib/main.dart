import 'package:flutter/material.dart';


import 'Screens/Bottom_Bar/CustomBottomBarPage.dart';

import 'Screens/MusicPlayer_Home/VtmHome.dart';
import 'Screens/Youtube_Videos/YoutubeVideo_Screen.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'VTM Music Player',
      home: Youtubevidepage(),
      routes: {

      'VtmHome': (context) => VtmHomePage(),
        'Bottombar':(context)=>BottomBarScreen(),

      },
    );
  }
}
