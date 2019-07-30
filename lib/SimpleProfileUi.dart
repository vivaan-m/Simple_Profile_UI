
import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'ServiceItems.dart';

class ProviderDetailScreen extends StatefulWidget {
  @override
  _ProviderDetailScreenState createState() => _ProviderDetailScreenState();
}

class _ProviderDetailScreenState extends State<ProviderDetailScreen> {
  List<String> imageList = [
    "https://cdn.dribbble.com/users/13754/screenshots/6854031/hillstation_2x.png",
    "https://d68b3152cf5d08c2f050-97c828cc9502c69ac5af7576c62d48d6.ssl.cf3.rackcdn.com/includes/img/cms/site-images/orig/kingston-university-02df4c2-communicationdesignillustration.jpg",
    "https://trendland.com/wp-content/uploads/2019/03/editorial-illustration-by-spiros-halaris-3.jpg",
    "https://cdn.dribbble.com/users/29836/screenshots/4748544/seafarer_dribbble.jpg",
    "https://s3-eu-central-1.amazonaws.com/centaur-wp/designweek/prod/content/uploads/2017/08/04094123/Aart-Jan-Venema-Green-Man-Festival.jpg",
    "https://www.nyfa.edu/student-resources/wp-content/uploads/2015/07/Bm_illustration_sm.jpg",
  ];
  List<String> textList = [
    "La Cars",
    "La Bags",
    "LA Glasses",
    "La AutoMobiles",
    "La Luxury",
    "La Air"
  ];
  String providerName = "LAmore";

  String providerEmail = "Lamore@gmail.com";

  white() => Colors.white;

  grey() => Colors.white54;

  black() => Colors.black;

  blue() => Colors.blue;

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    return Scaffold(
      backgroundColor: Colors.white,
      /*
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),*/
      body: SingleChildScrollView(
        physics: PageScrollPhysics(),
        child: SafeArea(
          child: Animator(            //Todo: Add Animator Library
              tween: Tween(begin: Offset(00,700),end: Offset(00,00)),
              duration: Duration(seconds: 1),
              builder:(anima){return Transform.translate(
                offset: anima.value,
                child: Container(
                  margin: EdgeInsets.only(top: 67),
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                      gradient: LinearGradient(
                          colors: [Colors.lightBlueAccent, Colors.blueAccent],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  child: Column(
                    children: <Widget>[
                      Animator(
                        duration: Duration(seconds: 1),
                        curve: Curves.elasticOut,
                        builder: (anim) {
                          return Transform.scale(
                            origin: Offset(00, -59),
                            scale: anim.value,
                            child: Transform.translate(
                              offset: Offset(00, -65),
                              child: CircleAvatar(
                                  backgroundColor: Colors.white54,
                                  radius: 70,
                                  backgroundImage: NetworkImage(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8oUbwzY315xqfyJ9AIfGC6eg9TSl6pKBS6uf5K4BwEokUjC4suA",
                                  )),
                            ),
                          );
                        },
                      ),
                      Transform.translate(
                        offset: Offset(00, -50),
                        child: Text(
                          providerName.toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontFamily: "right",
                              //todo: ADD Font Please For God Sake
                              fontSize: 30,
                              color: white()),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(00, -45),
                        child: Text(
                          providerEmail.toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: "right",
                              fontSize: 20,
                              color: grey()),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(00, -28),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              smallButton(
                                iconData: FontAwesomeIcons.phoneAlt,
                                color: blue(),
                              ),
                              smallButton(
                                  iconData: FontAwesomeIcons.solidCommentAlt,
                                  color: blue()), //todo:Add FontAwesomeIcon
                              smallButton(
                                  iconData: FontAwesomeIcons.solidStar, color: blue()),
                              smallButton(
                                  iconData: FontAwesomeIcons.mapMarkerAlt,
                                  color: blue()),
                            ],
                          ),
                        ),
                      ),
                      ShowAddress("Plot No 35 Janata Mkt, Sec-23, Krishi Bazaar,Mumbai,Maharashtra"),
                      SizedBox(height: 20,),
                      SizedBox(
                        height: 250,
                        child: PageView.builder(
                          physics: BouncingScrollPhysics(),
                          pageSnapping: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => ServiceItem(
                            imageLink: imageList[index],
                            serviceAddress: "random",
                            serviceTitle: textList[index],
                          ),
                          itemCount: 6,
                        ),
                      )
                    ],
                  ),
                ),
              );}
          ),
        ),
      ),
    );
  }
}

//<______________________________________________>
//<______________________________________________>
//<_____________Small Button Item________________>
//<______________________________________________>

Widget smallButton({IconData iconData, var color, VoidCallback onTap}) {
  return SizedBox(
    width: 90,
    height: 80,
    child: InkWell(
      onTap: onTap,
      child: Card(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 4,
          child: Icon(
            iconData,
            color: color,
          )),
    ),
  );
}

//<______________________________________________>
//<______________________________________________>
//<_____________Show Address Module______________>
//<______________________________________________>

class ShowAddress extends StatefulWidget {
  final String address;

  // final CustomerEntity customerEntity;

  ShowAddress(this.address);

  @override
  _ShowAddressState createState() => _ShowAddressState();
}

class _ShowAddressState extends State<ShowAddress> {
  bool data = true;

  bool showAddress = false;

  @override
  void initState() {
    //data = widget.customerEntity != null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.all(Radius.circular(50)),
        child: RaisedButton(
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50))),
          onPressed: () {
            if (!data) {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return SigninDialogScreen();
                  });
            } else {
              setState(() {
                showAddress = true;
              });
            }
          },
          color: showAddress ? Colors.white : Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(17.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Icon(
                    Icons.location_on,
                    color: showAddress ? Colors.blue : Colors.blue,
                    size: 26,
                  ),
                ),
                Expanded(
                  child: Text(
                    "${showAddress ? widget.address : 'Show Address'}",
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.ltr,
                    maxLines: 3,
                    softWrap: false,
                    style: TextStyle(
                        color: showAddress ? Colors.blue : Colors.blue,
                        fontSize: showAddress ? 13 : 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget SigninDialogScreen() => Container();
}

//<______________________________________________>
//<______________                 _______________>
//<_____________     Animation     ______________>
//<______________________________________________>
