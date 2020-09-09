import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vtm/Screens/Global_File/GlobalFile.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:share/share.dart';


class HistoryPage extends StatefulWidget {
  VoidCallback refreshScreen;

  HistoryPage({this.refreshScreen});

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {

  TextEditingController comment = new TextEditingController();
  //FirebaseFirestore firestore = FirebaseFirestore.instance;
  Firestore firestore = Firestore.instance;

  String ratingvalue;
  DateTime selectedDate = DateTime.now();


  sharedata(){
    Share.share("text");
  }

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

  void createRecord() async {
    DocumentReference ref = await firestore.collection("review")
        .add({
      'date': DateTime.now().toString().split(' ')[0],
      'rating': ratingvalue,
      'comment': comment.text.toString(),
    });
    print(ref.firestore);
  }




  _displayDialog(BuildContext context) async {
    var rating = 3.0;
    bool isFavorite = false;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Give Review'),
            content: Container(
              decoration: BoxDecoration(
                  //color: VtmLightBlue.withOpacity(0.2),
                  borderRadius:
                  BorderRadius.all(Radius.circular(16))),
              height: MediaQuery.of(context).size.height * 0.40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  /*Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () => _selectDate(context),
                        child: Text('Select date'),
                      ),


                    ],
                  ),*/
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Program Started: ",
                        style: TextStyle(
                          fontSize: 14,
                          color: VtmBlack,
                          fontFamily: 'Montserrat-Regular',
                          fontWeight: FontWeight.w600,),
                      ),
                      Text(DateTime.now().toString().split(' ')[0],
                          style: TextStyle(
                              color: VtmBlack,
                              fontSize: 14,
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
                    size: 30,
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

                  SizedBox(height: 10,),
                  RaisedButton(
                    child: new Text('SUBMIT'),
                    onPressed: () {
                      print(rating);
                      print(ratingvalue);
                      print(comment);
                      createRecord();
                      comment.text="";

                      Navigator.of(context).pop();
                    },
                  )
                  /*Row(
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
                  )*/
                ],
              ),
            ),
            /*actions: <Widget>[
              new FlatButton(
                child: new Text('SUBMIT'),
                onPressed: () {
                  createRecord();
                  Navigator.of(context).pop();
                },
              )
            ],*/
          );
        });
  }



  @override
  void initState() {
    // TODO: implement initState
    //Firebase.initializeApp().whenComplete(() => print("completed"));
    setState(() {
      //Firebase.initializeApp().whenComplete(() => print("completed"));
    });
    //getData();
    super.initState();
  }

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
                clickonmoreicon: (){
                  _displayDialog(context);

                },
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
              StreamBuilder(
                stream: Firestore.instance.collection("review").snapshots(),
                builder: (context, snapshot)
                {
                  if (!snapshot.hasData) {
                    return Text("Loading..");
                  }
                  return Expanded(

                    child: ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        return _buildList(context, snapshot.data.documents[index]);

                      },

                    ),
                  );


                },
              ),
              //Getdataa(context)


              /*Expanded(
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
              )*/
            ],
          ),
        ),
      ),
    );
  }
}
Widget _buildList(BuildContext context, DocumentSnapshot document) {
  bool isFavorite = false;
  var rating = double.parse(document['rating']);
  sharedata(){
    Share.share("text");
  }

  void Deletedialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        Firestore firestore = Firestore.instance;

        return AlertDialog(
          title: new Text("Delete"),
          content: new Text("Are You Sure Want To Delete?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 20
                    ),
                    child:  GestureDetector(
                        onTap: (){
                          Navigator.of(context).pop();
                        },child: new Text("Cancel")),
                  ),

                ],
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),

            FlatButton(
              child: Row(
                children: <Widget>[

                  GestureDetector(
                      onTap: () async {

                        await firestore.collection("review").document(document.documentID).delete();
                        Show_toast_Now("Deleted Successfully", Colors.red);
                        Navigator.of(context).pop();

                        // Navigator.of(context).pushNamed('dashboard');
                      },child: new Text("Ok")),
                ],
              ),
              onPressed: () async{
                await firestore.collection("review").document(document.documentID).delete();
                Show_toast_Now("Deleted Successfully", Colors.red);

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  return Column(
    children: <Widget>[
      Container(
        decoration: BoxDecoration(
            color: VtmLightBlue.withOpacity(0.2),
            borderRadius:
            BorderRadius.all(Radius.circular(16))),
        height: MediaQuery.of(context).size.height * 0.30,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Program Started: ",
                    style: TextStyle(
                      color: VtmBlack,
                      fontSize: 16,
                      fontFamily: 'Montserrat-Regular',
                      fontWeight: FontWeight.w600,),
                  ),
                  Text(document['date'],
                      style: TextStyle(
                          color: VtmBlack,
                          fontSize: 15,
                          fontFamily: 'Montserrat-Regular',
                          fontWeight: FontWeight.w600))
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Session Rating",
                style: TextStyle(
                    color: VtmBlack,
                    fontSize: 16,
                    fontFamily: 'Montserrat-Regular',
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5,
              ),
              SmoothStarRating(
                rating:rating,
                borderColor: VtmGrey,
                isReadOnly: true,
                size: 30,
                filledIconData: Icons.star,
//halfFilledIconData: Icons.star_half,
                defaultIconData: Icons.star_border,
                starCount: 5,
                allowHalfRating: true,
                spacing: 2.0,

              ),
              SizedBox(
                height: 5,
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: <Widget>[

                    Row(
                      children: <Widget>[
                        Text("Review:",style: TextStyle(
                            color: VtmBlack,fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    SingleChildScrollView(
                      child: Row(
                        children: <Widget>[
                          Text(document['comment'],style: TextStyle(
                              color: VtmBlack,fontSize: 14,
                              fontWeight: FontWeight.w500
                          ),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  GestureDetector(
                    onTap: (){
                      Deletedialog(context);
                    },
                    child: Container(
                        height: 20,
                        width: 20,
                        child: SvgPicture.asset(
                          'assets/images/dustbin.svg',
                          color: VtmBlack,
                        )),
                  ),

                  SizedBox(
                    width: 40,
                  ),
                  InkWell(
                      onTap: () {
                        print("as");

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
                  GestureDetector(
                    onTap: (){
                      sharedata();
                    },
                    child: Container(
                        height: 20,
                        width: 20,
                        child: SvgPicture.asset(
                          'assets/images/share.svg',
                          color: VtmGrey,
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      SizedBox(height: 20,)
    ],
  );
}
