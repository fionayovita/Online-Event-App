// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_event/model/webinar_data.dart';

class DetailPageWebinar extends StatelessWidget {
  final WebinarData webinar;
  DetailPageWebinar({required this.webinar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 700) {
            return DetailMobile(webinar: webinar);
          } else if (constraints.maxWidth <= 1000) {
            return DetailWeb(webinar: webinar);
          } else {
            return DetailWeb(webinar: webinar);
          }
        },
      ),
    ));
  }
}

class DetailMobile extends StatelessWidget {
  final WebinarData webinar;
  DetailMobile({required this.webinar});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.asset(webinar.imageAsset),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Color(0xFFF55446),
                    child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 16.0),
            child: Text(
              webinar.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(children: <Widget>[
                  Icon(Icons.calendar_today, color: Colors.amber),
                  SizedBox(height: 10),
                  Text(
                    webinar.date,
                  )
                ]),
                Column(
                  children: <Widget>[
                    Icon(Icons.access_time_filled, color: Colors.indigo),
                    SizedBox(height: 10),
                    Text(
                      webinar.time,
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(
                      Icons.redeem,
                      color: Colors.red,
                    ),
                    SizedBox(height: 10),
                    Text(webinar.benefit)
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              webinar.description,
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16.0, fontFamily: 'Poppins'),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.person,
                  color: Colors.red,
                ),
                SizedBox(width: 10),
                Expanded(
                    child: Text(
                  webinar.speaker,
                  style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold),
                ))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    final snackBar =
                        SnackBar(content: const Text('Register Success'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Text('Register Now',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFFF55446),
                      shadowColor: Colors.red,
                      fixedSize: Size(250, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),
                SizedBox(width: 30),
                FavoriteButton()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DetailWeb extends StatelessWidget {
  final WebinarData webinar;
  DetailWeb({required this.webinar});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.height * 2 / 3;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Color(0xFFF55446)),
            height: screenWidth,
          ),
          SafeArea(
            child: Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 30.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Color(0xFFF55446)),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
            ),
          ),
          Container(
            height: screenWidth,
            margin: EdgeInsets.only(top: 200),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 150, vertical: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 500,
                  height: 500,
                  child: Image.asset(webinar.imageAsset),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16.0),
                  child: Text(
                    webinar.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(children: <Widget>[
                        Icon(Icons.calendar_today, color: Colors.amber),
                        SizedBox(height: 10),
                        Text(
                          webinar.date,
                        )
                      ]),
                      Column(
                        children: <Widget>[
                          Icon(Icons.access_time_filled, color: Colors.indigo),
                          SizedBox(height: 10),
                          Text(
                            webinar.time,
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.redeem,
                            color: Colors.red,
                          ),
                          SizedBox(height: 10),
                          Text(webinar.benefit)
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    webinar.description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16.0, fontFamily: 'Poppins'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.person,
                        color: Colors.red,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                          child: Text(
                        webinar.speaker,
                        style: TextStyle(
                            fontSize: 15.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold),
                      ))
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          final snackBar =
                              SnackBar(content: const Text('Register Success'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: Text('Register Now',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFFF55446),
                            shadowColor: Colors.red,
                            fixedSize: Size(250, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                      ),
                      SizedBox(width: 30),
                      FavoriteButton()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Color(0xFFF55446),
      child: IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              isFavorite = !isFavorite;
            });
          }),
    );
  }
}
