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

    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      //drawer: CustomDrawer(),
      //bottomNavigationBar: CustomBottomBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: <Widget>[

                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .5,
                      decoration: new BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: new DecorationImage(
                            image: AssetImage('assets/images/bgofvtm.png',),
                            fit: BoxFit.cover,
                          )),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[


                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 10, 15, 20),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[

                                  GestureDetector(onTap: (){

                                      print("clicked");
                                      _scaffoldKey.currentState.openDrawer();

                                  },
                                      child: SvgPicture.asset(menuImage,height: MediaQuery.of(context).size.height*0.03,
                                        width: MediaQuery.of(context).size.width*0.03,color: VtmWhite,))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(
                height: 15,
              ),

    Container(

      height: MediaQuery.of(context).size.height*0.11,
    child: Stack(
    children: <Widget>[
    Center(
    child: Container(
      height: MediaQuery.of(context).size.height*0.06,
      width: MediaQuery.of(context).size.width*0.6,
      decoration: BoxDecoration(color: VtmLightBlue,
          boxShadow: [new BoxShadow(
            color: Colors.black,
            blurRadius: 5.0,
          ),],
    border: Border.all(
    color: VtmLightBlue.withOpacity(0.2), width: 0.0),
    borderRadius: BorderRadius.circular(40.0)),
    child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25.0),
    child: Row(
    children: <Widget>[
      SvgPicture.asset(
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
      ),
    Expanded(
    child: Container(),
    ),
      SvgPicture.asset(
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
      ),
    ],
    ),
    ),
    ),
    ),

      //circle 
      Align(
          alignment: Alignment.center,
          child: Container(
            height: MediaQuery.of(context).size.height*0.11,
            width: MediaQuery.of(context).size.height*0.11,
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
          ))
    ],
    ),
    ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Column(
                  children: [
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
                          "The Relief Of Pain",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: VtmBlue,
                              fontSize: 16,
                              fontFamily: 'Montserrat-SemiBold'),
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
                    SizedBox(height: 38,),
                    Row(crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(onTap:(){


                        } ,
                          child: Text("BUY PRO VERSION TO HEAR FULL PROGRAM",
                            style: TextStyle(
                                color: VtmRed,fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,fontSize: 12,
                                fontFamily: "Montserrat-Bold"
                            ),),
                        )
                      ],),
                  ],
                ),
              )
      ],),
        ),),
    );
  }
}
