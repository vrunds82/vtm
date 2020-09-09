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
     // bottomNavigationBar: CustomBottomBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomAppBar(menuiconclr: VtmBlue,
                text: "MORE",
                addiconclr: Colors.transparent,
                clickonmenuicon: (){
                  print("clicked");
                  _scaffoldKey.currentState.openDrawer();
                },),
              _getPostImage(),
              SizedBox(height: 5,),
              Padding(
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
                    SizedBox(height: 3,),
                    Row(
                      children: [
                        Text(post.author.name.toString(),style: TextStyle(
                          fontWeight: FontWeight.w600
                        ),),
                        Spacer(),
                        Text(post.date.replaceAll('T', ' '),style: TextStyle(
                          fontSize: 12,color: VtmGrey
                        ),)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(

                      width: MediaQuery.of(context).size.width,
                      child: SafeArea(
                        child: Html( data: post.content.rendered,
                          onLinkTap: (String url) {
                            _launchUrl(url);
                          },),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
