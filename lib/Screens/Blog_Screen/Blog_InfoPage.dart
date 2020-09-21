import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vtm/Screens/Global_File/GlobalFile.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart' as wp;
import 'package:url_launcher/url_launcher.dart';


class BlogInfo extends StatefulWidget {
  VoidCallback refreshScreen;
  wp.Post post;

  BlogInfo({this.post,this.refreshScreen});



  @override
  _BlogInfoState createState() => _BlogInfoState();
}

class _BlogInfoState extends State<BlogInfo> {
  wp.Post post;
  _getPostImage() {
    if (post.featuredMedia == null) {
      return SizedBox(height: 10,);
    } else {
      return Column(
        children: [
          Image.network(post.featuredMedia.sourceUrl),
          SizedBox(height: 10,),
        ],
      );
    }
  }

  _launchUrl(String link) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw 'Cannot launch $link';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //post = widget.post;
    post = Global.currentSelectedPost;
  }


  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return Scaffold(
      drawer: CustomDrawer(refresh: widget.refreshScreen,),
      key: _scaffoldKey,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomAppBar(menuiconclr: VtmBlue,
              text: "MORE",
              addiconclr: Colors.transparent,
              clickonmenuicon: (){
                print("clicked");
                _scaffoldKey.currentState.openDrawer();
              },
            onBack: (){
              Global.currentPageIndex=4;
              widget.refreshScreen();
            },),



            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(7, 0, 7, 0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Expanded(
                        child: Scrollbar(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15,0,15,0),
                              child: Column(
                                children: <Widget>[

                                  _getPostImage(),

                                  Text(post.title.rendered.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: VtmBlue,
                                        fontFamily: 'MontserratSubrayada-Bold'
                                    ),),
                                  SizedBox(height: 5,),
                                  /*Row(
                                    children: [
                                      Text(post.author.name.toString(),style: TextStyle(
                                          fontFamily: 'MontserratSubrayada-Bold',
                                          fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),),
                                      Spacer(),
                                      Text(post.date.substring(0,10),style: TextStyle(
                                          fontFamily: 'MontserratSubrayada-Bold',

                                          fontSize: 12,color: VtmGrey
                                      ),)
                                    ],
                                  ),*/
                                  SizedBox(height: 10,),
                                  Container(

                                    width: MediaQuery.of(context).size.width,
                                    child: SingleChildScrollView(
                                      child: Html( data: post.content.rendered,linkStyle: TextStyle(
                                          fontFamily: 'MontserratSubrayada-Bold',
                                        fontSize: 20
                                      ),
                                        onLinkTap: (String url) {
                                          _launchUrl(url);
                                        },),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
