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
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
     // bottomNavigationBar: CustomBottomBar(),
      body: SafeArea(
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

                      height: MediaQuery.of(context).size.height*0.38,
                      width: MediaQuery.of(context).size.width,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [


                        new Expanded(
                          flex: 1,
                          child: new SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            //.horizontal
                            child: new Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,\n \n and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                             textAlign: TextAlign.justify, style: new TextStyle(
                                fontSize: 12.0,fontWeight: FontWeight.w500
                                ,color: VtmGrey.withOpacity(0.6)
                              ),
                            ),
                          ),
                        ),
                        Html( data: post.content.rendered,
                          onLinkTap: (String url) {
                            _launchUrl(url);
                          },)
                      ],
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
