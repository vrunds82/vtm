import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vtm/Screens/Global_File/GlobalFile.dart';

class BlogInfo extends StatefulWidget {
  @override
  _BlogInfoState createState() => _BlogInfoState();
}

class _BlogInfoState extends State<BlogInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomAppBar(menuiconclr: VtmBlue,
                text: "MORE",
                addiconclr: Colors.transparent,),
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


                    ],
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("BLOG TAGLINE",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),),
                  SizedBox(height: 3,),
                  Row(
                    children: [
                      Text("TAGLINE 02",style: TextStyle(
                        fontWeight: FontWeight.w400
                      ),),
                      Spacer(),
                      Text("22.09.2020",style: TextStyle(
                        fontSize: 12
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
                            style: new TextStyle(
                              fontSize: 13.0,fontWeight: FontWeight.w500
                              ,color: VtmGrey.withOpacity(0.6)
                            ),
                          ),
                        ),
                      ),
                    ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
