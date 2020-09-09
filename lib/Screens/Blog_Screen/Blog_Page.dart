import 'package:flutter/material.dart';
import 'package:vtm/Screens/Blog_Screen/Blog_InfoPage.dart';
import 'package:vtm/Screens/Global_File/GlobalFile.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart' as wp;
import 'dart:io';



class BlogScreen extends StatefulWidget {
  VoidCallback refreshScreen;

  BlogScreen({this.refreshScreen});

  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {

  wp.WordPress wordPress = wp.WordPress(
    baseUrl: 'http://blog.vtm-stein.de/',
  );
  var _wifiEnabled;

  test()async{
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        _wifiEnabled = true;
      }
    } on SocketException catch (_) {
      print('not connected');
      _wifiEnabled = false;
      Show_toast_Now("No Internet Connection", Colors.red);
    }
  }

  _fetchPosts() {
    Future<List<wp.Post>> posts = wordPress.fetchPosts(
        postParams: wp.ParamsPostList(
          context: wp.WordPressContext.view,
          pageNum: 1,
          perPage: 10,
        ),
        fetchAuthor: true,
        fetchFeaturedMedia: true,
        fetchComments: true
    );

    return posts;
  }

  _getPostImage(wp.Post post) {
    if (post.featuredMedia == null) {
      return  Image.asset('assets/images/userdemo.jpg');
    }
    return Image.network(post.featuredMedia.sourceUrl);
  }

@override
  void initState() {
    // TODO: implement initState

  test();
  super.initState();
  }
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
              SizedBox(height: 5,),
              Expanded(
                child: FutureBuilder(
                    future: _fetchPosts(),
                    builder: (BuildContext context,AsyncSnapshot<List<wp.Post>> snapshot){
                      if(snapshot.connectionState == ConnectionState.none){

                        return Container();
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return _wifiEnabled?
                      ListView.builder(
                          itemCount: 1,
                          itemBuilder: (BuildContext ctxt, int index) {
                            wp.Post post = snapshot.data[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * .3,
                                decoration: new BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    image: new DecorationImage(
                                      image: AssetImage('assets/images/userdemo.jpg'),
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
                                                post.title.rendered.toString(),
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: VtmBlack,
                                                    // fontWeight: FontWeight.bold,
                                                    fontFamily: 'Montserrat-Black'),
                                              ),
                                              Text(
                                                  post.author.name,
                                                style: TextStyle(fontWeight: FontWeight.w600,
                                                    fontSize: 14,
                                                    color: VtmBlack,
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
                            );
                          })
                          :Center(child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.signal_wifi_off,size: 50,),
                              SizedBox(height: 15,),
                              Text("No Internet Connection",style: TextStyle(fontSize: 16),),
                            ],
                          ));
                    }

                ),
              ),

              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .5,
                  child: FutureBuilder(
                    future: _fetchPosts(),
                    builder: (BuildContext context,AsyncSnapshot<List<wp.Post>> snapshot){
                      if(snapshot.connectionState == ConnectionState.none){
                        return Container();
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: SizedBox(),
                        );
                      }
                      return _wifiEnabled?
                      ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            wp.Post post = snapshot.data[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BlogInfo(post: post,)
                                    )
                                );
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


                                              child:
                                              _getPostImage(post)
                                              /* Padding(
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
                                              ),*/
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.fromLTRB(5, 0, 3, 0),
                                              child: Container(
                                                  width: MediaQuery.of(context).size.width*0.51,
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    children: <Widget>[
                                                      Text(post.title.rendered.toString(),
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 16,
                                                            fontFamily: 'Montserrat-Regular'
                                                        ),),
                                                      SizedBox(
                                                        height: 3,
                                                      ),
                                                      Text(post.author.name,
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontFamily: 'Montserrat-Regular'
                                                        ),),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                                post.date.substring(0,10),
                                                            style: TextStyle(fontSize: 14,
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
                          }):SizedBox();
                    }

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
