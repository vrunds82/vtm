import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vtm/Screens/Global_File/GlobalFile.dart';

class InfoScreen extends StatefulWidget {

  VoidCallback refreshScreen;


  InfoScreen({this.refreshScreen});

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {


    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(refresh: widget.refreshScreen,),
     // bottomNavigationBar: CustomBottomBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 00),
            child: Column(
              children: [
                CustomAppBar(text: "VTM",addiconclr: Colors.transparent,
                menuiconclr: VtmBlue,
                  clickonmenuicon: (){
                    print("clicked");
                    _scaffoldKey.currentState.openDrawer();
                  },),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(color: VtmWhite,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [BoxShadow(color: Colors.black12,blurRadius: 20,offset: Offset(00, 00))]
                    ),

                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                        padding: const EdgeInsets.all(20)
                      ,child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Hintegrunde",
                                  style: TextStyle(fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat-Regular'
                                  ),),
                                  Text("Tiefensuggetion",style: TextStyle(
                                    color: VtmGrey,fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                      fontFamily: 'Montserrat-Medium'
                                  ),)
                                ],
                              ),
                              Spacer(),
                              Container(
                                  width: MediaQuery.of(context).size.width*0.17,
                                  height:MediaQuery.of(context).size.height*0.10,
                                  decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image: new AssetImage('assets/images/user.jpeg')
                                      )
                                  )),
                            ],
                          ),
                          SizedBox(height: 10,),
                          new SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            //.horizontal
                            child: new Text(
"\nDr. Arnd Stein\n\nDr. Arnd Stein holds a doctorate in psychology from famous Ruhr-Universitat Bochum, Germany and has been in private practice since 1975. He is also a noted author and popular contributor to many international radio and television programs.\n\nDr. Arnd Stein developed a technique of treatment for patients involving music played over a slowed beat, and has written a number of books and released a number of CDs featuring said works. Based in Germany, Stein has also contributed to magazines and newspapers. He co-founded the company VTM – Verlag fuer therapeutische Medien, the base for all of his other media activities."      ,                      textAlign: TextAlign.justify,style: new TextStyle(
                                fontSize: 12.0,
                                  fontFamily: 'Montserrat-Light',

                              ),
                            ),
                          ),
                          SizedBox(height: 30,),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Text("INHALT",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),),
                SizedBox(height: 10,),
                Row(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Arnend Stein"),
                    SizedBox(
                      width: 30,
                    ),
                    Text("2 - min",style: TextStyle(
                      fontFamily: 'Montserrat-Regular',
                    ),)
                  ],
                ),
                SizedBox(height: 5,),
                Row(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Arnend Stein",style: TextStyle(
                      fontFamily: 'Montserrat-Regular',
                    )),
                    SizedBox(
                      width: 30,
                    ),
                    Text("2 - min",style: TextStyle(
                      fontFamily: 'Montserrat-Regular',
                    ))
                  ],
                ),
                SizedBox(height: 5,),
                Row(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Arnend Stein"),
                    SizedBox(
                      width: 30,
                    ),
                    Text("2 - min")
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
