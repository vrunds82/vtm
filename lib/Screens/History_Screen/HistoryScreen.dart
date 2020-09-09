import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
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
  bool isFavorite = false;


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
      'isFavourite':isFavorite
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
            title: Center(child: Text('Give Review')),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))
            ),
            content: Container(
              decoration: BoxDecoration(
                  //color: VtmLightBlue.withOpacity(0.2),

                  borderRadius:
                  BorderRadius.all(Radius.circular(40))),
              height: MediaQuery.of(context).size.height * 0.35,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Divider(color: VtmGrey.withOpacity(0.9),thickness: 1,),
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Program Started: ",
                        style: TextStyle(
                          fontSize: 14,
                          color:VtmGrey.withOpacity(0.9),
                          fontFamily: 'Montserrat-Regular',
                          fontWeight: FontWeight.w600,),
                      ),
                      Text(DateTime.now().toString().split(' ')[0],
                          style: TextStyle(
                              color: VtmGrey.withOpacity(0.9),
                              fontSize: 14,
                              fontFamily: 'Montserrat-Regular',
                              fontWeight: FontWeight.w600))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Did the session help?",
                    style: TextStyle(
                        color: VtmGrey.withOpacity(0.9),
                        fontFamily: 'Montserrat-Regular',
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
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
                    height: 10,
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
                                color: VtmGrey.withOpacity(0.2),
                                width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: VtmGrey.withOpacity(0.2),
                                width: 1.0),
                          ),
                          hintText:
                          "Your personal remark about the session",
                          hintStyle: TextStyle(
                              color: VtmGrey.withOpacity(0.9),
                              fontFamily: 'Montserrat-Regular',
                              fontSize: 14)),
                      style: TextStyle(
                          color: VtmGrey.withOpacity(0.9),
                          fontWeight: FontWeight.w500),
                    ),
                  ),

                  SizedBox(height: 10,),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: VtmWhite)
                    ),
                    color: VtmBlue,
                    child: new Text('SUBMIT',style: TextStyle(
                      color: VtmWhite
                    ),),
                    onPressed: () {
                      print(rating);
                      //print(ratingvalue);
                      print("Comment"+comment.toString());
                      if(comment.text==""||ratingvalue==null){
                        Show_toast_Now("Please fill the field", Colors.red);
                      }
                      else {
                        createRecord();
                        Show_toast_Now("Review Submitted", Colors.green);

                        Navigator.of(context).pop();
                      }
                      comment.text="";


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



            ],
          ),
        ),
      ),
    );
  }
}
Widget _buildList(BuildContext context, DocumentSnapshot document) {
  bool isFavorite = document['isFavourite'];
  Firestore firestore = Firestore.instance;

  var rating = double.parse(document['rating']);


  sharedata(){
    Share.share("Program On: " + document['date']+ "\nDid the session help ?: " + document['rating'] + "\nReview: " + document['comment']);
  }

  _updateData() async {
    await firestore
        .collection('review')
        .document(document.documentID)
        .updateData({'isFavourite':isFavorite});
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
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 5.0,
          child: Container(
            decoration: BoxDecoration(
                color: VtmWhite,
                borderRadius:
                BorderRadius.all(Radius.circular(16))),
            height: MediaQuery.of(context).size.height * 0.37,
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
                          color: VtmGrey.withOpacity(0.9),
                          fontSize: 16,
                          fontFamily: 'Montserrat-Regular',
                          fontWeight: FontWeight.w600,),
                      ),
                      Text(document['date'],
                          style: TextStyle(
                              color: VtmGrey.withOpacity(0.9),
                              fontSize: 15,
                              fontFamily: 'Montserrat-Regular',
                              fontWeight: FontWeight.w600))
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Did the session help ?",
                    style: TextStyle(
                        color: VtmGrey.withOpacity(0.9),
                        fontSize: 16,
                        fontFamily: 'Montserrat-Regular',
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SmoothStarRating(
                    rating:rating,
                    borderColor: VtmGrey.withOpacity(0.9),
                    isReadOnly: true,
                    size: 40,
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

                        /*Row(
                          children: <Widget>[
                            Text("Review:",style: TextStyle(
                                color: VtmBlack,fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),),
                          ],
                        ),*/
                        SizedBox(height: 10,),
                        SingleChildScrollView(
                          child: Container(
                            height: 100,
                            width: 400,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: VtmGrey.withOpacity(0.2),
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SingleChildScrollView(
                                child: Text(document['comment'],style: TextStyle(
                                    color: VtmGrey.withOpacity(1.0),fontSize: 14,
                                    fontFamily: 'Montserrat-Regular',
                                    fontWeight: FontWeight.w500
                                ),),
                              ),
                            ),
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


                      isFavorite==true
                          ? GestureDetector(
                        onTap: (){
                        isFavorite=false;
                        print(isFavorite);
                        _updateData();
                      },
                            child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                          )
                          : GestureDetector(
                        onTap: (){
                          isFavorite=true;
                          print(isFavorite);
                          _updateData();
                        },
                            child: Icon(
                        Icons.favorite,
                        color: VtmGrey,
                      ),
                          ),
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
        ),
      ),
      SizedBox(height: 20,)
    ],
  );
}
