import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vtm/Screens/Global_File/GlobalFile.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';


class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    var rating = 3.0; 
    bool isFavorite = false;
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      //bottomNavigationBar: CustomBottomBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
          child: Column(
            children: [
              CustomAppBar(addiconclr: VtmBlue,
              text: "HISTORY",
              menuiconclr: VtmBlue,
                clickonmenuicon: (){
                  print("clicked");
                  _scaffoldKey.currentState.openDrawer();
                },),
              SizedBox(height: 10,),
              Expanded(
                  child:Center(
                    child: new ListView.builder
                      (
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: new Container(
                              decoration: BoxDecoration(color: VtmWhite,
                                  borderRadius: BorderRadius.all(Radius.circular(16))
                              ),
                              height: MediaQuery.of(context).size.height*0.40,
child: Column(crossAxisAlignment: CrossAxisAlignment.center,

  children: [
    SizedBox(height: 15,),
        Text("Program Started 20.7.2020 - 20.13",style: TextStyle(
          color: VtmGrey.withOpacity(0.3),
          fontFamily: 'Montserrat-Regular',
           fontWeight: FontWeight.w600
        ),),
    SizedBox(height: 5,),
    Text("Did the session help?",style: TextStyle(
      color: VtmGrey.withOpacity(0.3),
        fontFamily: 'Montserrat-Regular',
        fontWeight: FontWeight.w600
    ),),
    SizedBox(height: 5,),
                                SmoothStarRating(
                                  rating: rating,borderColor: VtmGrey.withOpacity(0.2),
                                  isReadOnly: false,
                                  size: 40,
                                  filledIconData: Icons.star,
                                  //halfFilledIconData: Icons.star_half,
                                  defaultIconData: Icons.star_border,
                                  starCount: 5,
                                  allowHalfRating: true,
                                  spacing: 2.0,
                                  onRated: (value) {
                                    print("rating value -> $value");
                                    // print("rating value dd -> ${value.truncate()}");
                                  },
                                ),
    SizedBox(height: 5,),

    Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: TextField(maxLines: 3,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: VtmGrey.withOpacity(0.2), width: 1.0),
          ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: VtmGrey.withOpacity(0.2), width: 1.0),
      ),
        hintText: "Your personal remark about the session",hintStyle: TextStyle(
          color: VtmGrey.withOpacity(0.2),
          fontFamily: 'Montserrat-Regular',
          fontSize: 14
        )

        ),
        style: TextStyle(color: VtmGrey,fontWeight: FontWeight.w500),
      ),
    ),
    SizedBox(height: 10,),
    Row(crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Container(height: 20,width: 20,
            child: SvgPicture.asset('assets/images/dustbin.svg',color: VtmGrey.withOpacity(0.2),)),
        SizedBox(width: 40,),
        InkWell(
            onTap: () {
              isFavorite = !isFavorite;
              setState(() {
              });
            },
            child: isFavorite ? Icon(
              Icons.favorite,
              color: Colors.red,
            ): Icon(Icons.favorite,color: VtmGrey.withOpacity(0.2),)),
        SizedBox(width: 40,),
        Container(height: 20,width: 20,
            child: SvgPicture.asset('assets/images/share.svg',color: VtmGrey.withOpacity(0.2),)),

      ],
    )

  ],
),
                            ),
                          );

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
