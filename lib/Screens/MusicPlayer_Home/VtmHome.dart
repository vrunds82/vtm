import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vtm/Config/Constants.dart';
import 'package:vtm/Screens/Global_File/GlobalFile.dart';
import 'package:seekbar/seekbar.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:vtm/Services/audioPlayer.dart';


class VtmHomePage extends StatefulWidget {
  VoidCallback refreshScreen;

  VtmHomePage({this.refreshScreen});

  @override
  _VtmHomePageState createState() => _VtmHomePageState();
}

class _VtmHomePageState extends State<VtmHomePage> {
  double currentValue = 0.0;
  double maxValue = 0.0;
  double _secondValue = 0.0;
  Timer _progressTimer;
  Timer _secondProgressTimer;
  bool _done = false;
  bool isplaying = false;
  Duration _duration = Duration();
  Duration _position = Duration();
  Duration maxDuration;
  double audioDuration;




  Future<void> initplayer()
  async {
      maxDuration = CommonPlayer.assetsAudioPlayer.current.value.audio.duration;
      audioDuration = double.parse(maxDuration.inSeconds.toString());
      print("Audio :::::::::::::::::::::$maxDuration $audioDuration ${CommonPlayer.assetsAudioPlayer.current.value.audio.assetAudioPath}");
      setState(() {

      });
  }

  String localFilePath;


  Widget slider() {


    bool scrolling=false;
    double scrollingvalue=0;

    return StreamBuilder(



        stream: CommonPlayer.assetsAudioPlayer.currentPosition,
        builder: (context, asyncSnapshot) {
          final Duration duration = asyncSnapshot.data;

          if(duration!=null) {
            currentValue = duration.inSeconds.toDouble();
            maxValue = maxDuration!=null?maxDuration.inSeconds.toDouble():0;
          }
          if(duration!=null&&!scrolling){
            scrollingvalue=duration.inSeconds.toDouble();
          }

          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Slider(
                        activeColor: VtmBlue,
                        inactiveColor: VtmBlue,
                        value:scrolling?scrollingvalue:currentValue,
                        min: 0.0,
                        max: audioDuration??100,
                        onChangeStart: (v){
                          print("Starting");
                          scrolling=true;
                        },
                      onChanged: (value){
                          scrollingvalue=value;
                          currentValue=value;

                      },
                       onChangeEnd:  (double value) async {
                          scrolling=false;
                          currentValue=value;
                           await CommonPlayer.assetsAudioPlayer.seek(Duration(seconds: value.toInt()));
                           initplayer();
                      //    print(value);
                            value = value;

                        },
                    ),

                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Text(scrolling?"${(scrollingvalue~/60).toInt().toString().padLeft(2,"0")}:${(scrollingvalue%60).toInt().toString().padLeft(2,"0")}":"${(currentValue~/60).toInt().toString().padLeft(2,"0")}:${(currentValue%60).toInt().toString().padLeft(2,"0")}"),
                    Spacer(),
                    Text("${(maxValue~/60).toInt().toString().padLeft(2,"0")}:${(maxValue%60).toInt().toString().padLeft(2,"0")}")
                  ],
                ),
              )
            ],
          );
        });/*Slider(
        activeColor: VtmBlue,
        inactiveColor: VtmBlue,
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            seekToSecond(value.toInt());
            value = value;
          });
        });*/
  }



  @override
  void initState() {
    initplayer();

    super.initState();
  }


  @override
  void dispose() {
  //  assetsAudioPlayer.dispose();
    super.dispose();
  }

  final String addImage = 'assets/images/menu.svg';
  final String menuImage = 'assets/images/menu.svg';
  final String forwardImage = 'assets/images/Forward.svg';
  final String backwardImage = 'assets/images/backward.svg';
  final String pauseImage = 'assets/images/Pause.svg';
  final String infoReadImage = 'assets/images/inforead.svg';
  final String repeatImage = 'assets/images/reapeat.svg';
  final String playIntroImage = 'assets/images/playintro.svg';
  final String playImage = 'assets/images/Play.svg';

  var rating = 3.0;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(
        refresh: widget.refreshScreen,
      ),
      //bottomNavigationBar: CustomBottomBar(),
      body: Column(
        children: [
          Container(color: Colors.red,),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: <Widget>[
                      Center(
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height * .5,
                                  decoration: new BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      image: new DecorationImage(
                                        image: AssetImage(
                                          'assets/images/bgForPlayer.png',
                                        ),
                                        fit: BoxFit.cover,
                                      )),
                                  child: SafeArea(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(25, 20, 15, 20),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  GestureDetector(
                                                      onTap: () {
                                                        print("clicked");
                                                        _scaffoldKey.currentState
                                                            .openDrawer();
                                                      },
                                                      child: Container(
                                                          height: MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.06,
                                                          width: MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.06,
                                                          child: SvgPicture.asset(
                                                            menuImage,
                                                            color: VtmWhite,
                                                          )))
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 70,)
                              ],
                            ),
                            Positioned(
                              bottom: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.width*0.15,
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          child: Center(
                                            child: Container(
                                              height: MediaQuery.of(context).size.width * 0.12,
                                              width: MediaQuery.of(context).size.width * 0.55,
                                              decoration: BoxDecoration(
                                                  color: keysBackground,

                                                  border: Border.all(
                                                      color: VtmLightBlue.withOpacity(0.2),
                                                      width: 0.0),
                                                  borderRadius: BorderRadius.circular(40.0)),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                                                child: Row(
                                                  children: <Widget>[
                                                    GestureDetector(
                                                      onTap: (){
                                                     //   ChangeAudio();
                                                        CommonPlayer.assetsAudioPlayer.seekBy(Duration(seconds: -10));
                                                      },
                                                      child: SvgPicture.asset(
                                                        backwardImage,
                                                        color: VtmBlue,
                                                        height:
                                                        MediaQuery.of(context).size.width * 0.05,
                                                        width: MediaQuery.of(context).size.width * 0.05,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(),
                                                    ),
                                                    GestureDetector(
                                                      onTap: (){
                                                        //ChangeAudio();
                                                        CommonPlayer.assetsAudioPlayer.seekBy(Duration(seconds: 10));
                                                      },
                                                      child: SvgPicture.asset(
                                                        forwardImage,
                                                        color: VtmBlue,
                                                        height:
                                                        MediaQuery.of(context).size.width * 0.05,
                                                        width: MediaQuery.of(context).size.width * 0.05,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        //circle
                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Center(
                                                  child: Container(
                                                    height: MediaQuery.of(context).size.width * 0.15,
                                                    width: MediaQuery.of(context).size.width * 0.15,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      boxShadow: [
                                                        new BoxShadow(
                                                          color: Colors.black26,
                                                          blurRadius: 3.0,
                                                        ),
                                                      ],
                                                    ),
                                                    //color: Colors.lightBlueAccent,
                                                    child:
                                                    GestureDetector(
                                                      onTap: ()async{
                                                        print("sdada");
                                                        if(CommonPlayer.assetsAudioPlayer.isPlaying.value){
                                                          CommonPlayer.assetsAudioPlayer.pause();
                                                        }else
                                                          {
                                                            CommonPlayer.assetsAudioPlayer.play();
                                                          }

                                                 initplayer();
                                                      },
                                                      child: Center(child:
                                                      ClipOval(
                                                        child: Material(
                                                          color: VtmWhite, // button color
                                                          child: SizedBox(
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(16.0),
                                                                child: Padding(
                                                                  padding: EdgeInsets.only(left: CommonPlayer.assetsAudioPlayer.isPlaying.value? 0:8.0),
                                                                  child: SvgPicture.asset(
                                                                    CommonPlayer.assetsAudioPlayer.isPlaying.value? pauseImage:playImage,
                                                                    color: VtmBlue,
                                                                    fit: BoxFit.contain,
                                                                  ),
                                                                ),
                                                              )),
                                                        ),
                                                      )
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          /*        SizedBox(
                    height: 15,
                  ),*/

                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Global.currentPageIndex=0;
                              widget.refreshScreen();
                            },
                            child: Container(
                                child: SvgPicture.asset(
                              infoReadImage,
                              color: VtmBlue,
                              height: MediaQuery.of(context).size.width * 0.05,
                              width: MediaQuery.of(context).size.width * 0.05,
                            )),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          GestureDetector(
                            onTap: () async {


                              if(CommonPlayer.assetsAudioPlayer.loopMode.value==LoopMode.single)
                                {
                                  await CommonPlayer.assetsAudioPlayer
                                      .setLoopMode(LoopMode.none);
                                }else {
                                await CommonPlayer.assetsAudioPlayer
                                    .setLoopMode(LoopMode.single);
                              }
                              setState(() {

                              });

                              //CommonPlayer.assetsAudioPlayer.seek(Duration(seconds: 0));
                            },
                            child: Container(
                                child: SvgPicture.asset(
                              repeatImage,
                              color: CommonPlayer.assetsAudioPlayer.loopMode.value==LoopMode.single?VtmBlue:VtmInActiveColor,
                              height: MediaQuery.of(context).size.width * 0.05,
                              width: MediaQuery.of(context).size.width * 0.05,
                            )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:15.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  CommonPlayer.assetsAudioPlayer.current.value.audio.assetAudioPath=="assets/audio/001.mp3"?trackone_text??"The Relief of Pain":introduction_text??"Introduction to program(german)",

                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: VtmBlue,
                                      fontSize: 17,
                                      fontFamily: 'Montserrat-SemiBold'),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Dr. Arnd Stein",
                                  style: TextStyle(color: Colors.black, fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(

                        padding: EdgeInsets.symmetric(horizontal: 0),
                        alignment: Alignment.center,
                        child: slider()
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:15.0),

                        child: GestureDetector(
                          onTap: (){

                              ChangeAudio();
                              //  advancedPlayer.pause();
                            //Global.currentPageIndex=0;
                            widget.refreshScreen();
                          },
                          child: Row(
                            children: [
                              Container(
                                  height: MediaQuery.of(context).size.width * 0.07,
                                  width: MediaQuery.of(context).size.width * 0.07,
                                  child: SvgPicture.asset(
                                    playIntroImage,
                                    color: VtmBlue,
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                              CommonPlayer.assetsAudioPlayer.current.value.audio.assetAudioPath=="assets/audio/002.mp3"? trackone_text??"The Relief of Pain":introduction_text??"Introduction to program(german)",
                                style: TextStyle(color: VtmBlue, fontSize: 17),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              buyProVersion_text??"BUY PRO VERSION TO HEAR FULL PROGRAM",
                              style: TextStyle(
                                  color: VtmRed,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 12,
                                  fontFamily: "Montserrat-Bold"),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  ChangeAudio() async {


    print("Current Audio ::::::: ${CommonPlayer.assetsAudioPlayer.current.value.audio.assetAudioPath=="assets/audio/002.mp3"?"Audio 1":"Audio 2"}");
    print("Changing to ||||||||| ${CommonPlayer.assetsAudioPlayer.current.value.audio.assetAudioPath=="assets/audio/002.mp3"?"Audio 1":"Audio 2"}");
    await CommonPlayer.assetsAudioPlayer.playlistPlayAtIndex(CommonPlayer.assetsAudioPlayer.current.value.audio.assetAudioPath=="assets/audio/002.mp3"?0:1);

    initplayer();


  }

  //return Loop Icon
replay(){


}


}
