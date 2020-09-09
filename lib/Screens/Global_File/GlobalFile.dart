import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vtm/Screens/MusicPlayer_Home/VtmHome.dart';

const VtmBlue = Colors.blue;
const VtmGrey = Colors.grey;
const VtmLightBlue = Colors.lightBlueAccent;
const VtmWhite = Colors.white;
const VtmRed = Colors.red;
const VtmBlack = Colors.black;

class Global {
  static int currentPageIndex = 0;
  static double iconSize = 0.07;
}

class CustomAppBar extends StatelessWidget {
  final String text;
  final bool isMore;
  final Color addiconclr;
  final Color menuiconclr;
  final VoidCallback clickonmenuicon;
  final VoidCallback clickonmoreicon;

  final String addImage = 'assets/images/more.svg';
  final String menuImage = 'assets/images/menu.svg';

  CustomAppBar(
      {this.text,
      this.isMore,
      this.addiconclr,
      this.menuiconclr,
      this.clickonmenuicon,
      this.clickonmoreicon});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: <Widget>[
                  Container(
                      height: MediaQuery.of(context).size.width * 0.05,
                      width: MediaQuery.of(context).size.width * 0.05,
                      child: GestureDetector(
                          onTap: clickonmenuicon,
                          child: SvgPicture.asset(
                            menuImage,
                            color: menuiconclr,
                          ))),
                  Spacer(),
                  Text(
                    text,
                    style: TextStyle(
                        fontSize: 18,
                        color: VtmBlue,
                        //fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat-Black'),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: clickonmoreicon,
                    child: SvgPicture.asset(
                      addImage,
                      height: MediaQuery.of(context).size.width * 0.05,
                      width: MediaQuery.of(context).size.width * 0.05,
                      color: addiconclr,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final String playerImage = 'assets/images/player.svg';
final String infoImage = 'assets/images/info.svg';
final String historyImage = 'assets/images/history.svg';
final String videoImage = 'assets/images/youtube.svg';
final String moreImage = 'assets/images/menu.svg';
final String legalImage = 'assets/images/legal.svg';
final String moreInfo = 'assets/images/moreinfo.svg';

class CustomBottomBar extends StatefulWidget {
  final VoidCallback click;

  CustomBottomBar({this.click});

  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          boxShadow: [
            new BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 5,
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  print(Global.currentPageIndex);
                  Global.currentPageIndex = 0;
                  // Navigator.of(context).pushReplacementNamed('InfoPage');
                  setState(() {});
                  widget.click();
                },
                child: SvgPicture.asset(
                  'assets/images/info.svg',
                  color: Global.currentPageIndex == 0 ? VtmBlue : VtmGrey,
                  height: MediaQuery.of(context).size.width * Global.iconSize,
                  width: MediaQuery.of(context).size.width * Global.iconSize,
                  fit: BoxFit.contain,
                ),
              ),
              /*Spacer(),*/
              GestureDetector(
                onTap: () {
                  Global.currentPageIndex = 1;
                  // Navigator.of(context).pushReplacementNamed('Musicplayer_VtmHome');
                  setState(() {});
                  widget.click();
                },
                child: SvgPicture.asset(
                  'assets/images/player.svg',
                  color: Global.currentPageIndex == 1 ? VtmBlue : VtmGrey,
                  height: MediaQuery.of(context).size.width * Global.iconSize,
                  width: MediaQuery.of(context).size.width * Global.iconSize,
                  fit: BoxFit.contain,
                ),
              ),
              /*Spacer(),*/
              GestureDetector(
                onTap: () {
                  Global.currentPageIndex = 2;
                  // Navigator.of(context).pushReplacementNamed('YoutubeVideoPage');
                  setState(() {});
                  widget.click();
                },
                child: SvgPicture.asset(
                  'assets/images/youtube.svg',
                  color: Global.currentPageIndex == 2 ? VtmBlue : VtmGrey,
                  height: MediaQuery.of(context).size.width * Global.iconSize,
                  width: MediaQuery.of(context).size.width * Global.iconSize,
                  fit: BoxFit.contain,
                ),
              ),
              /*Spacer(),*/
              GestureDetector(
                onTap: () {
                  Global.currentPageIndex = 3;
                  // Navigator.of(context).pushReplacementNamed('HistoryPage');
                  setState(() {});
                  widget.click();
                },
                child: SvgPicture.asset(
                  'assets/images/history.svg',
                  color: Global.currentPageIndex == 3 ? VtmBlue : VtmGrey,
                  height: MediaQuery.of(context).size.width * Global.iconSize,
                  width: MediaQuery.of(context).size.width * Global.iconSize,
                  fit: BoxFit.contain,
                ),
              ),
              /*Spacer(),*/
              GestureDetector(
                onTap: () {
                  Global.currentPageIndex = 4;
                  //Navigator.of(context).pushReplacementNamed('Musicplayer_VtmHome');
                  setState(() {});
                  widget.click();
                },
                child: SvgPicture.asset(
                  moreInfo,
                  color: Global.currentPageIndex == 4 ? VtmBlue:VtmGrey,
                  height: MediaQuery.of(context).size.width * Global.iconSize,
                  width: MediaQuery.of(context).size.width * Global.iconSize,
                  fit: BoxFit.contain,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

//Drawer
class CustomDrawer extends StatelessWidget {

  VoidCallback refresh;


  CustomDrawer({this.refresh});

  @override
  Widget build(BuildContext context) {

    double gapBetweenTiles = MediaQuery.of(context).size.width*0.08;


    return Container(
      width: MediaQuery.of(context).size.width * 0.55,
      child: Drawer(
        child: SafeArea(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              ListTile(onTap: (){

                Global.currentPageIndex = 1;
                refresh();
              },
                contentPadding:
                EdgeInsets.only(left: 0, right: 0, bottom: 0, top: 0),
                title: Column(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: new BoxDecoration(
                            image: new DecorationImage(
                              image: new AssetImage("assets/images/songcover.jpeg"),
                              fit: BoxFit.cover,
                            ))),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "The Relief of Pain",
                      style: TextStyle(
                          fontFamily: 'Montserrat-SemiBold',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Dr. Arnd Stein",
                      style: TextStyle(fontFamily: 'Montserrat-Light'),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 15, 15, 0),
                child: Column(
                  children: [
                    GestureDetector(onTap: (){
                      Global.currentPageIndex = 1;
                      refresh();
                    },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            playerImage,
                            height: MediaQuery.of(context).size.height * 0.025,
                            width: MediaQuery.of(context).size.width * 0.025,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Player',
                            style: TextStyle(
                                fontFamily: 'MontserratSubrayada-Bold',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: gapBetweenTiles,
                      thickness: 1,
                    ),
                    GestureDetector(onTap: (){
                      Global.currentPageIndex = 0;
                      refresh();
                    },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            infoImage,
                            height: MediaQuery.of(context).size.height * 0.025,
                            width: MediaQuery.of(context).size.width * 0.025,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Infos',
                            style: TextStyle(
                                fontFamily: 'MontserratSubrayada-Bold',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: gapBetweenTiles,
                      thickness: 1,
                    ),
                    GestureDetector(onTap: (){
                      Global.currentPageIndex = 3;
                      refresh();
                    },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            historyImage,
                            height: MediaQuery.of(context).size.height * 0.025,
                            width: MediaQuery.of(context).size.width * 0.025,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'History',
                            style: TextStyle(
                                fontFamily: 'MontserratSubrayada-Bold',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: gapBetweenTiles,
                      thickness: 1,
                    ),
                    GestureDetector(onTap: (){
                      Global.currentPageIndex = 2;
                      refresh();
                    },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            videoImage,
                            height: MediaQuery.of(context).size.height * 0.025,
                            width: MediaQuery.of(context).size.width * 0.025,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Videos',
                            style: TextStyle(
                                fontFamily: 'MontserratSubrayada-Bold',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: gapBetweenTiles,
                      thickness: 1,
                    ),
                    GestureDetector(onTap: (){
                      Global.currentPageIndex = 4;
                      refresh();
                    },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            moreInfo,
                            height: MediaQuery.of(context).size.height * 0.025,
                            width: MediaQuery.of(context).size.width * 0.025,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'More',
                            style: TextStyle(
                                fontFamily: 'MontserratSubrayada-Bold',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: gapBetweenTiles,
                      thickness: 1,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          legalImage,
                          height: MediaQuery.of(context).size.height * 0.025,
                          width: MediaQuery.of(context).size.width * 0.025,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Legal',
                          style: TextStyle(
                              fontFamily: 'MontserratSubrayada-Bold',
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Show_toast_Now(String msg,Color color){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb	: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0
  );
}