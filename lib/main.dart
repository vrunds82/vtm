import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vtm/Screens/Global_File/GlobalFile.dart';
import 'Screens/Blog_Screen/Blog_InfoPage.dart';
import 'Screens/Blog_Screen/Blog_Page.dart';
import 'Screens/Bottom_Bar/CustomBottomBarPage.dart';
import 'Screens/History_Screen/HistoryScreen.dart';
import 'Screens/InfoScreen/Info_page.dart';
import 'Screens/MusicPlayer_Home/VtmHome.dart';
import 'Screens/Splash_Screen/SplashScreen.dart';
import 'Screens/Youtube_Videos/YoutubeVideo_Screen.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      fontFamily: "Montserrat-SemiBold",
        appBarTheme: AppBarTheme(
          color: VtmWhite,iconTheme: IconThemeData(color: VtmBlue)
        )

      ),

      debugShowCheckedModeBanner: false,
      title: 'The Relief of Pain',
      home: SplashScreenPage(),
      routes: {

        'Musicplayer_VtmHome': (context) => VtmHomePage(),
        'Bottombar':(context)=>BottomBarScreen(),
        'Historypage':(context)=>HistoryPage(),
        'InfoPage':(context)=>InfoScreen(),
        'YoutubeVideoPage':(context)=>Youtubevidepage(),
        'SplashScreen':(context)=>SplashScreenPage(),
        "BlogScreen":(context)=>BlogScreen(),
        "BlogInfoPage":(context)=>BlogInfo(),
  },
    );
  }
}
