import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const VtmBlue = Colors.blue;
const VtmGrey = Colors.grey;
const VtmLightBlue = Colors.lightBlueAccent;
const VtmWhite = Colors.white;
const VtmRed = Colors.red;

class Global{
  static int currentPageIndex = 0;
  static double iconSize = 0.07;
}



class CustomAppBar extends StatelessWidget {

  final String text;
  final bool isMore;
  final Color addiconclr;
  final Color menuiconclr;

  final String addImage = 'assets/images/more.svg';
  final String menuImage = 'assets/images/menu.svg';

  CustomAppBar({this.text,this.isMore,this.addiconclr,this.menuiconclr});

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
                  Container(height: MediaQuery.of(context).size.width*0.05,
                      width: MediaQuery.of(context).size.width*0.05,
                      child: GestureDetector(
                          onTap: (){
                            CustomDrawer();
                          },child: SvgPicture.asset(menuImage,color: menuiconclr,))),
                 Spacer(),
                  Text(text,style: TextStyle(
                    fontSize: 26,color: VtmBlue,
                    fontWeight: FontWeight.bold
                  ),),
                  Spacer(),
                 SvgPicture.asset(addImage,height: MediaQuery.of(context).size.width*0.05,
                   width: MediaQuery.of(context).size.width*0.05,color: addiconclr,),
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
final String historymage = 'assets/images/history.svg';
final String videoImage = 'assets/images/youtube.svg';
final String moreImage = 'assets/images/menu.svg';
final String legalImage = 'assets/images/legal.svg';


class CustomBottomBar extends StatefulWidget {
  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white,
        borderRadius: BorderRadius.only(topRight:  Radius.circular(20),
        topLeft: Radius.circular(20)),
          boxShadow: [new BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
          ),]
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Global.currentPageIndex = 0;
                //Navigator.of(context).pushReplacementNamed('');
                setState(() {

                });
              },
              child: SvgPicture.asset('assets/images/info.svg',
                color: Global.currentPageIndex==0?
                  VtmBlue:VtmGrey,

                height: MediaQuery.of(context).size.width * Global.iconSize,
                width: MediaQuery.of(context).size.width * Global.iconSize,
                fit: BoxFit.contain,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Global.currentPageIndex = 1;
               // Navigator.of(context).pushReplacementNamed('');
                setState(() {

                });
              },
              child:  SvgPicture.asset('assets/images/player.svg',
                color: Global.currentPageIndex==1?
                VtmBlue:VtmGrey,
                height: MediaQuery.of(context).size.width * Global.iconSize,
                width: MediaQuery.of(context).size.width * Global.iconSize,
                fit: BoxFit.contain,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Global.currentPageIndex = 2;
               // Navigator.of(context).pushReplacementNamed('');
                setState(() {

                });
              },
              child: SvgPicture.asset('assets/images/youtube.svg',
                color: Global.currentPageIndex==2?
                VtmBlue:VtmGrey,

                height: MediaQuery.of(context).size.width * Global.iconSize,
                width: MediaQuery.of(context).size.width * Global.iconSize,
                fit: BoxFit.contain,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Global.currentPageIndex = 3;
                //Navigator.of(context).pushReplacementNamed('');
                setState(() {

                });
              },
              child: SvgPicture.asset('assets/images/history.svg',
                color: Global.currentPageIndex==3?
                VtmBlue:VtmGrey,

                height: MediaQuery.of(context).size.width * Global.iconSize,
                width: MediaQuery.of(context).size.width * Global.iconSize,
                fit: BoxFit.contain,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Global.currentPageIndex = 4;
                //Navigator.of(context).pushReplacementNamed('');
                setState(() {

                });
              },
              child: SvgPicture.asset('assets/images/youtube.svg',
                color: Global.currentPageIndex==4?
                VtmBlue:VtmGrey,

                height: MediaQuery.of(context).size.width * Global.iconSize,
                width: MediaQuery.of(context).size.width * Global.iconSize,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//Drawer
class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/bg.jpg"),
                          fit: BoxFit.cover)),
                  child: Text("Header"),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: ListView(children: [
                ListTile(
                  title: Text("Home"),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: Text("Home"),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: Text("Home"),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: Text("Home"),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: Text("Home"),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: Text("Home"),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),

              ]),
            )
          ],
        ),
      )
    );
  }
}
