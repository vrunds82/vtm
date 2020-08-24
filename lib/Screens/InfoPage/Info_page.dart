import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vtm/Screens/Global_File/GlobalFile.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {



    return Scaffold(bottomNavigationBar: CustomBottomBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
          child: Column(
            children: [
              CustomAppBar(text: "VTM",addiconclr: Colors.transparent,
              menuiconclr: VtmBlue,),
              Container(
                decoration: BoxDecoration(color: VtmWhite,
                  borderRadius: BorderRadius.all(Radius.circular(16))
                ),
                height: MediaQuery.of(context).size.height*0.65,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10)
                  ,child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Hintefrunde",
                              style: TextStyle(fontSize: 26,
                                fontWeight: FontWeight.bold
                              ),),
                              Text("Tiefensuggetion",style: TextStyle(
                                color: VtmGrey,fontSize: 12
                              ),)
                            ],
                          ),
                          Spacer(),
                          Container(
                              width: MediaQuery.of(context).size.width*0.17,
                              height:MediaQuery.of(context).size.height*0.10,
                              decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: new AssetImage('assets/images/bg.jpg')
                                  )
                              )),
                        ],
                      ),
                      SizedBox(height: 10,),
                      new Expanded(
                        flex: 1,
                        child: new SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          //.horizontal
                          child: new Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,\n \n and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                            style: new TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
SizedBox(height: 15,),
              Text("INHALT",style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 5,),
              Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Arnend Stein"),
                  SizedBox(
                    width: 30,
                  ),
                  Text("2 - min")
                ],
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Arnend Stein"),
                  SizedBox(
                    width: 30,
                  ),
                  Text("2 - min")
                ],
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Arnend Stein"),
                  SizedBox(
                    width: 30,
                  ),
                  Text("2 - min")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
