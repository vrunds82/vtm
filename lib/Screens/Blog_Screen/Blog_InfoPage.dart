import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vtm/Screens/Global_File/GlobalFile.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart' as wp;
import 'package:url_launcher/url_launcher.dart';


class BlogInfo extends StatefulWidget {

  wp.Post post;

  BlogInfo({this.post});



  @override
  _BlogInfoState createState() => _BlogInfoState();
}

class _BlogInfoState extends State<BlogInfo> {
  wp.Post post;
  _getPostImage() {
    if (post.featuredMedia == null) {
      return SizedBox(height: 10,);
    } else {
      return Image.network(post.featuredMedia.sourceUrl);
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
    post = widget.post;
  }


  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
     /*appBar: AppBar(
       title: Center(
         child: Text("MORE",style: TextStyle(
             fontSize: 18,
             color: VtmBlue,
             //fontWeight: FontWeight.bold,
             fontFamily: 'Montserrat-Black'

         ),),
       ),
     ),*/
     // bottomNavigationBar: CustomBottomBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomAppBar(menuiconclr: VtmBlue,
                text: "MORE",
                addiconclr: Colors.transparent,
                clickonmenuicon: (){
                  print("clicked");
                  _scaffoldKey.currentState.openDrawer();
                },),

              SizedBox(height: 15,),
              _getPostImage(),
              SizedBox(height: 15,),
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(7, 0, 7, 0),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(post.title.rendered.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: 'Montserrat-Black'
                        ),),
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Text(post.author.name.toString(),style: TextStyle(
                                fontFamily: 'Montserrat-Black',
                                fontWeight: FontWeight.w600
                            ),),
                            Spacer(),
                            Text(post.date.replaceAll('T', ' '),style: TextStyle(
                                fontFamily: 'Montserrat-Black',

                                fontSize: 12,color: VtmGrey
                            ),)
                          ],
                        ),
                        SizedBox(height: 10,),
                        Expanded(
                          child: Container(

                            width: MediaQuery.of(context).size.width,
                            child: SingleChildScrollView(
                              child: Html( data: post.content.rendered,linkStyle: TextStyle(
                                  fontFamily: 'Montserrat-Black',
                                fontSize: 16
                              ),
                                onLinkTap: (String url) {
                                  _launchUrl(url);
                                },),
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
      ),
    );
  }
}
