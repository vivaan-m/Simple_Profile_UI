//import 'package:evento_provider/model/services_entity.dart';
//import 'package:evento_provider/screens/services/editOptions/ServiceOptionScreen.dart';
import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  String imageLink;

  String serviceTitle;

  String serviceAddress;

  //final ServicesData data;

  ServiceItem({this.imageLink,this.serviceTitle,this.serviceAddress});

  List<Widget> _buildStarRatingButtons() {
    List<Widget> buttons = [];

    for (int rateValue = 1; rateValue <= 5; rateValue++) {
      final starRatingButton = Icon(
          2 >= rateValue ? Icons.star : Icons.star_border,
          color: Colors.yellow,
          size: 26);
      buttons.add(starRatingButton);
    }

    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        InkWell(
          onTap: () {/*
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ServiceOptionScreen(data)));*/
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                height: 160,
                width: MediaQuery.of(context).size.width,
                child: Material(
                  elevation: 7,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: NetworkImage(imageLink),
                            fit: BoxFit.cover)),
                  ),
                )),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width - 100,
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.only(top: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 8),
                      child: Text(
                        serviceTitle,
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildStarRatingButtons(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
