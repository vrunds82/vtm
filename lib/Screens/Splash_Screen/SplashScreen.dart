import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'dart:async';

import 'package:vtm/Screens/Global_File/GlobalFile.dart';
import 'package:vtm/Services/audioPlayer.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {


  final String imagename = 'assets/images/logo.svg';
  Widget get svg => SvgPicture.asset(
    imagename,width: 50,height: 50,
    color: VtmBlue,


  );

  startTime() async {

    await CommonPlayer.assetsAudioPlayer.open(
        Playlist(
            audios: [
              Audio("assets/audio/001.mp3"),
              Audio("assets/audio/002.mp3")
            ]
        )

        , autoStart: false,
        showNotification: true);

    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('Bottombar');
  }

  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          children: [
            Spacer(),
            Container(height: 200,width: 200,

                child: SvgPicture.asset(imagename,color: VtmBlue,)),
            SizedBox(height: 20,),
            Text("The Relief of Pain",style: TextStyle(
                color: VtmBlue,fontWeight: FontWeight.bold,
                fontSize: 36
            ),),
            Spacer(),
            Text("VTM Dr. Stein",style: TextStyle(
              color: VtmBlue,fontWeight: FontWeight.bold,
              fontSize: 30
            ),),
            SizedBox(height: 2,),
          /*  Text("Dr.Stein",style: TextStyle(
                color: VtmBlue,fontWeight: FontWeight.bold,
                fontSize: 20
            ),),*/
            Spacer(),
          ],
        ),
      ),
    );
  }
}
