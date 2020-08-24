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
    return Scaffold(
bottomNavigationBar: CustomBottomBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
          child: SafeArea(
            child: Column(
              children: [
                CustomAppBar(text: "YT VIDEO",menuiconclr: VtmBlue,addiconclr: Colors.transparent,),
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
                                      Card(
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              width: MediaQuery.of(context).size.width*0.37,


                                              child: Padding(
                                                padding: const EdgeInsets.fromLTRB(
                                                    5, 5, 5, 5),
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(30.0))),
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(12)),
                                                      child:
                                                      Image.asset("assets/images/bg.jpg",),
                                                    )),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.fromLTRB(5, 0, 3, 0),
                                              child: Container(
                                                  width: MediaQuery.of(context).size.width*0.51,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Text("LOREL IPSUM LORIOSM LOREL IPSUM",
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 14
                                                        ),),
                                                      SizedBox(
                                                        height: 3,
                                                      ),
                                                      Text("Lorem ipsum is simply dummy text of the printing",
                                                        style: TextStyle(
                                                            fontSize: 12
                                                        ),),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "August 9th,2020",
                                                            style: TextStyle(fontSize: 10,
                                                                fontWeight: FontWeight.bold),
                                                          ),
                                                          Spacer(),
                                                          Text(
                                                            "READ MORE",
                                                            style: TextStyle(fontSize: 10,
                                                                fontWeight: FontWeight.bold),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                          ],
                                        ),
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
      ),

    );
  }
}
