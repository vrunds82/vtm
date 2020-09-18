import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          perPage: 50,
        ),
        fetchAuthor: true,
        fetchFeaturedMedia: true,
        fetchComments: true
    );

    if(Global.myPOSTs==null){
      Global.myPOSTs=posts;
    }

    return  Global.myPOSTs??posts;
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
      drawer: CustomDrawer(refresh: widget.refreshScreen,),
      //bottomNavigationBar: CustomBottomBar(),
      body: SafeArea(
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
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          wp.Post post = snapshot.data[index];
                          print(snapshot.data[index].attachments!=null?snapshot.data[index].featuredMedia.link:"--");
                          return MiniBlogTile(post: post,refreshScreen: widget.refreshScreen,);
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

          ],
        ),
      ),
    );
  }
}

class MiniBlogTile extends StatelessWidget {
  wp.Post post;
  VoidCallback refreshScreen;
  MiniBlogTile({this.post,this.refreshScreen});

  final String imagename = 'assets/images/logo.svg';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(4.0,0,4,0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width*.25,
            child: Card(
              child: InkWell(
                onTap: (){
                  Global.currentSelectedPost=post;
                  Global.currentPageIndex=5;
                  refreshScreen();

                },
                splashColor: VtmLightBlue,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      post.featuredMedia!=null?ClipRRect(borderRadius: BorderRadius.circular(4),
                          child: Image.network(post.featuredMedia.sourceUrl,height:MediaQuery.of(context).size.width*.25,width: MediaQuery.of(context).size.width*.4,fit: BoxFit.cover ,)):
                      Container(

    height:MediaQuery.of(context).size.width*.25,width: MediaQuery.of(context).size.width*.4,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(imagename,color: VtmBlue,),
                        ),
                      ),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(post.title.rendered.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  fontFamily: 'Montserrat-Regular',
                                color: VtmBlue

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
Spacer(),
                            Row(
                              children: [

                                Text(
                                  "READ MORE",
                                  style: TextStyle(fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat-Regular'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }
}

