import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vtm/Screens/Global_File/GlobalFile.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';


class HistoryPage extends StatefulWidget {
  VoidCallback refreshScreen;

  HistoryPage({this.refreshScreen});

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {

  TextEditingController comment = new TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String ratingvalue;
  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
  //final databaseReference = FirebaseFirestore.instance;

  /*void createRecord() async {
    DocumentReference ref = await databaseReference.collection("review")
        .add({
      'date': "${selectedDate.toLocal()}".split(' ')[0],
      'rating': ratingvalue,
      'comment': comment.text.toString(),
    });
    print(ref.id);
  }*/


  @override
  Widget build(BuildContext context) {
    var rating = 3.0;
    bool isFavorite = false;
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(
        refresh: widget.refreshScreen,
      ),
      //bottomNavigationBar: CustomBottomBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
          child: Column(
            children: [
              CustomAppBar(
                addiconclr: VtmBlue,
                text: "HISTORY",
                menuiconclr: VtmBlue,
                clickonmenuicon: () {
                  print("clicked");
                  _scaffoldKey.currentState.openDrawer();
                },
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Center(
                  child: new ListView.builder(
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: new Container(
                            decoration: BoxDecoration(
                                color: VtmLightBlue.withOpacity(0.2),
                                borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                            height: MediaQuery.of(context).size.height * 0.40,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    RaisedButton(
                                      onPressed: () => _selectDate(context),
                                      child: Text('Select date'),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    RaisedButton(
                                      onPressed: () {
                                        //createRecord();
                                      },
                                      child: Text('submit'),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Program Started: ",
                                      style: TextStyle(
                                        color: VtmBlack,
                                        fontFamily: 'Montserrat-Regular',
                                        fontWeight: FontWeight.w600,),
                                    ),
                                    Text("${selectedDate.toLocal()}".split(' ')[0],
                                        style: TextStyle(
                                            color: VtmBlack,
                                            fontFamily: 'Montserrat-Regular',
                                            fontWeight: FontWeight.w600))
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Did the session help?",
                                  style: TextStyle(
                                      color: VtmBlack,
                                      fontFamily: 'Montserrat-Regular',
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                SmoothStarRating(
                                  rating: rating,
                                  borderColor: VtmGrey,
                                  isReadOnly: false,
                                  size: 40,
                                  filledIconData: Icons.star,
                                  //halfFilledIconData: Icons.star_half,
                                  defaultIconData: Icons.star_border,
                                  starCount: 5,
                                  allowHalfRating: true,
                                  spacing: 2.0,
                                  onRated: (value) {
                                    ratingvalue=value.toString();
                                    print("rating value " + ratingvalue);
                                    // print("rating value dd -> ${value.truncate()}");
                                  },
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: TextField(
                                    controller: comment,
                                    maxLines: 3,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: VtmBlack,
                                              width: 1.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: VtmBlack,
                                              width: 1.0),
                                        ),
                                        hintText:
                                        "Your personal remark about the session",
                                        hintStyle: TextStyle(
                                            color: VtmBlack,
                                            fontFamily: 'Montserrat-Regular',
                                            fontSize: 14)),
                                    style: TextStyle(
                                        color: VtmBlack,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: 20,
                                        width: 20,
                                        child: SvgPicture.asset(
                                          'assets/images/dustbin.svg',
                                          color: VtmBlack,
                                        )),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          isFavorite = !isFavorite;
                                          setState(() {});
                                        },
                                        child: isFavorite
                                            ? Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        )
                                            : Icon(
                                          Icons.favorite,
                                          color: VtmGrey,
                                        )),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Container(
                                        height: 20,
                                        width: 20,
                                        child: SvgPicture.asset(
                                          'assets/images/share.svg',
                                          color: VtmGrey,
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),

              Expanded(
                child: Center(
                  child: new ListView.builder(
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: new Container(
                            decoration: BoxDecoration(
                                color: VtmLightBlue.withOpacity(0.2),
                                borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                            height: MediaQuery.of(context).size.height * 0.40,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Program Started: ",
                                      style: TextStyle(
                                        color: VtmBlack,
                                        fontFamily: 'Montserrat-Regular',
                                        fontWeight: FontWeight.w600,),
                                    ),
                                    Text("${selectedDate.toLocal()}".split(' ')[0],
                                        style: TextStyle(
                                            color: VtmBlack,
                                            fontFamily: 'Montserrat-Regular',
                                            fontWeight: FontWeight.w600))
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Did the session help?",
                                  style: TextStyle(
                                      color: VtmBlack,
                                      fontFamily: 'Montserrat-Regular',
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                SmoothStarRating(
                                  rating: rating,
                                  borderColor: VtmGrey,
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
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: TextField(
                                    maxLines: 3,
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: VtmBlack,
                                              width: 1.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: VtmBlack,
                                              width: 1.0),
                                        ),
                                        hintText:
                                        "Your personal remark about the session",
                                        hintStyle: TextStyle(
                                            color: VtmBlack,
                                            fontFamily: 'Montserrat-Regular',
                                            fontSize: 14)),
                                    style: TextStyle(
                                        color: VtmBlack,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: 20,
                                        width: 20,
                                        child: SvgPicture.asset(
                                          'assets/images/dustbin.svg',
                                          color: VtmBlack,
                                        )),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          isFavorite = !isFavorite;
                                          setState(() {});
                                        },
                                        child: isFavorite
                                            ? Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        )
                                            : Icon(
                                          Icons.favorite,
                                          color: VtmGrey,
                                        )),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Container(
                                        height: 20,
                                        width: 20,
                                        child: SvgPicture.asset(
                                          'assets/images/share.svg',
                                          color: VtmGrey,
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
