import 'package:flutter/material.dart';
import 'package:vtm/Screens/Global_File/GlobalFile.dart';

class BlogScreen extends StatefulWidget {
  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return Scaffold( key: _scaffoldKey,
      drawer: CustomDrawer(),
      //bottomNavigationBar: CustomBottomBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: Column(
            children: [
              CustomAppBar(menuiconclr: VtmBlue,
              text: "MORE",
               addiconclr: Colors.transparent,
                clickonmenuicon: (){
                  print("clicked");
                  _scaffoldKey.currentState.openDrawer();
                },),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .3,
                  decoration: new BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: new DecorationImage(
                        image: AssetImage('assets/images/bg.jpg'),
                        fit: BoxFit.cover,
                      )),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
Spacer(flex: 2,),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 15, 20),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[

                                Text(
                                  "BLOG TAGLINE",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: VtmWhite,
                                     // fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat-Black'),
                                ),
                                Text(
                                  "TAGLINE 02",
                                  style: TextStyle(fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: VtmWhite,
                                    fontFamily: 'Montserrat-SemiBold'
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
                                            width: MediaQuery.of(context).size.width*0.35,


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
                                                    Text("LOREAL IPSUM LORIOSM LOREL IPSUM",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 12,
                                                      fontFamily: 'Montserrat-Regular'
                                                    ),),
                                                    SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text("Lorem ipsum is simply dummy text of the printing",
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                        fontFamily: 'Montserrat-Regular'
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
                                                              fontWeight: FontWeight.bold,
                                                              fontFamily: 'Montserrat-Regular'),
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
    );
  }
}
