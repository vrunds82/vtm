import 'package:flutter/material.dart';
import 'package:vtm/Screens/Global_File/GlobalFile.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class Youtubevidepage extends StatefulWidget {
  @override
  _YoutubevidepageState createState() => _YoutubevidepageState();
}

class _YoutubevidepageState extends State<Youtubevidepage> {

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'iLnmTe5Q2Qw',
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
    ),
  );


  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      //bottomNavigationBar: CustomBottomBar(),
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
          child: SafeArea(
            child: Column(
              children: [
                CustomAppBar(text: "YT VIDEO",menuiconclr: VtmBlue,addiconclr: Colors.transparent,
                  clickonmenuicon: (){
                    print("clicked");
                    _scaffoldKey.currentState.openDrawer();
                  },),
                SizedBox(height: 10,),
                YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.amber,
                  progressColors: ProgressBarColors(
                      playedColor: Colors.amber,
                      handleColor: Colors.lightBlue
                  ),
                  onReady: (){
                    },
                ),
SizedBox(height: 20,),
                Expanded(
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .5,
                      child: new ListView.builder(
                          itemCount: 5,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return GestureDetector(
                              onTap: () {

                            },
                            child: Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.39,


                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 5, 0, 5),
                                            child: Container(

                                                child: ClipRRect(

                                                  child:
                                                  Image.asset("assets/images/bg.jpg",),
                                                )),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.fromLTRB(5, 0, 3, 0),
                                          child: Container(
                                              width: MediaQuery.of(context).size.width*0.50,
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text("Your Video Title",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w800,
                                                        fontSize: 14,
                                                      fontFamily: 'Montserrat-SemiBold'
                                                    ),),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text("13.4k Videos",
                                                    style: TextStyle(
                                                        fontSize: 10,color: VtmGrey.withOpacity(0.3)
                                                    ),),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Text(
                                                    "Chillyfy Playlist",
                                                    style: TextStyle(fontSize: 10,
                                                        fontWeight: FontWeight.bold,color: VtmGrey.withOpacity(0.3)),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[],
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),);
  }
}
