import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vtm/Screens/Global_File/GlobalFile.dart';
import 'package:seekbar/seekbar.dart';

class VtmHomePage extends StatefulWidget {
  @override
  _VtmHomePageState createState() => _VtmHomePageState();
}

class _VtmHomePageState extends State<VtmHomePage> {
  double _value = 0.0;
  double _secondValue = 0.0;

  Timer _progressTimer;
  Timer _secondProgressTimer;

  bool _done = false;

  @override
  void initState() {
    _resumeProgressTimer();
    _secondProgressTimer =
        Timer.periodic(const Duration(milliseconds: 10), (_) {
      setState(() {
        _secondValue += 0.001;
        if (_secondValue >= 1) {
          _secondProgressTimer.cancel();
        }
      });
    });
    super.initState();
  }

  _resumeProgressTimer() {
    _progressTimer = Timer.periodic(const Duration(milliseconds: 10), (_) {
      setState(() {
        _value += 0.0005;
        if (_value >= 1) {
          _progressTimer.cancel();
          _done = true;
        }
      });
    });
  }

  @override
  void dispose() {
    _progressTimer?.cancel();
    _secondProgressTimer?.cancel();
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

  var rating = 3.0;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {




    return Scaffold(bottomNavigationBar: CustomBottomBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
          child: Column(
            children: [
              CustomAppBar(
                text: "VTM",
                menuiconclr: VtmBlue,
                addiconclr: Colors.transparent,
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Stack(
                          children: <Widget>[
                            //Bg image
                            Center(
                              child: Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.9,
                                    height: MediaQuery.of(context).size.height * 0.38,
                                    decoration: new BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20.0)),

                                      image: new DecorationImage(
                                        image: new AssetImage(
                                          "assets/images/bg.jpg",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height*0.06,
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                            //Forward Backward
                            Positioned(
                              bottom: 0,
                              right: 0,left: 0,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Column(
                                  children: [
                                    Container(
                                      height: MediaQuery.of(context).size.height*0.07,
                                      width: MediaQuery.of(context).size.width*0.6,
                                      decoration: BoxDecoration(
                                        color: VtmLightBlue,
                                        borderRadius:
                                        BorderRadius.circular(40.0),
                                        boxShadow: [new BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 5.0,
                                        ),],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25.0),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                                child: SvgPicture.asset(
                                                  backwardImage,
                                                  color: VtmBlue,
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      0.05,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      0.05,
                                                )),
                                            Expanded(
                                              child: Container(),
                                            ),
                                            Container(
                                                child: SvgPicture.asset(
                                                  forwardImage,
                                                  color: VtmBlue,
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      0.05,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      0.05,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 5,
                                      height: MediaQuery.of(context).size.height*0.02,
                                      //color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //Circle
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height*0.12,
                                    width: MediaQuery.of(context).size.height*0.12,
                                    decoration: BoxDecoration(shape: BoxShape.circle,
                                      boxShadow: [new BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 5.0,
                                      ),],
                                    ),
                                    //color: Colors.lightBlueAccent,
                                    child: ClipOval(
                                      child: Material(
                                        color: VtmWhite, // button color
                                        child: InkWell(
                                          // inkwell color
                                          child: SizedBox(
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                    28.0),
                                                child: SvgPicture.asset(
                                                  pauseImage,
                                                  color: VtmBlue,
                                                  fit: BoxFit.contain,
                                                ),
                                              )),
                                          onTap: () {},
                                        ),
                                      ),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      child: SvgPicture.asset(
                    infoReadImage,
                    color: VtmBlue,
                    height: MediaQuery.of(context).size.width * 0.05,
                    width: MediaQuery.of(context).size.width * 0.05,
                  )),
                  SizedBox(
                    width: 40,
                  ),
                  Container(
                      child: SvgPicture.asset(
                    repeatImage,
                    color: VtmBlue,
                    height: MediaQuery.of(context).size.width * 0.05,
                    width: MediaQuery.of(context).size.width * 0.05,
                  )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "The Reief Of pain",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: VtmBlue,
                        fontSize: 16),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Dr. Arnend Stein",
                    style: TextStyle(color: VtmBlue, fontSize: 14),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 0),
                alignment: Alignment.center,
                child: SeekBar(
                  value: _value,
                  secondValue: _secondValue,
                  thumbColor: VtmBlue,
                  progressColor: VtmBlue,
                  //secondProgressColor: VtmLightBlue.withOpacity(0.5),
                  onStartTrackingTouch: () {
                    print('onStartTrackingTouch');
                    if (!_done) {
                      _progressTimer?.cancel();
                    }
                  },
                  onProgressChanged: (value) {
                    print('onProgressChanged:$value');
                    _value = value;
                  },
                  onStopTrackingTouch: () {
                    print('onStopTrackingTouch');
                    if (!_done) {
                      _resumeProgressTimer();
                    }
                  },
                ),
              ),
              SizedBox(height: 10,),

Row(children: [
  Container(height: MediaQuery.of(context).size.width*0.07,
      width: MediaQuery.of(context).size.width*0.07,
      child: SvgPicture.asset(playIntroImage,color: VtmBlue,)),
  SizedBox(width: 10,),
  Text("Introduction To Program ",style: TextStyle(
    color: VtmBlue,fontSize: 14
  ),)
],),
              SizedBox(height: 20,),
              Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                GestureDetector(onTap:(){


                } ,
                  child: Text("BUY PRO VERSION TO HEAR FULL PROGRAM",
                  style: TextStyle(
                    color: VtmRed,fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,fontSize: 12
                  ),),
                )
              ],)

            ],
          ),
        ),
      ),
    );
  }
}
