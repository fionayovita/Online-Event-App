import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth <= 700) {
              return ProfileMobile();
            } else {
              return ProfileWeb();
            }
          },
        ),
      ),
    );
  }
}

class ProfileMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height * 2 / 3;
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Color(0xFFF55446)),
            height: screenHeight,
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Color(0xFFF55446)),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          ),
          Container(
            height: screenHeight,
            margin: EdgeInsets.only(top: 180),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(16),
                    width: 200,
                    height: 200,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/profile.JPG'),
                    ),
                  ),
                  Text('Fiona Yovita Syafri',
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Icon(Icons.email, color: Colors.indigo),
                      SizedBox(width: 10),
                      Text(
                        'fionayovita2311@gmail.com',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.person, color: Colors.amberAccent),
                      SizedBox(width: 10),
                      Text(
                        'Mahasiswa',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.emoji_events, color: Colors.redAccent),
                      SizedBox(width: 10),
                      Text(
                        'Event Participated: 5',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  )
                ]),
          )
        ],
      ),
    );
  }
}

class ProfileWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height * 2 / 3;
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Color(0xFFF55446)),
            height: screenHeight,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 150, vertical: 30.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Color(0xFFF55446)),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          ),
          Container(
            height: screenHeight,
            margin: EdgeInsets.only(top: 180),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 50),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(16),
                    width: 200,
                    height: 200,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/profile.JPG'),
                    ),
                  ),
                  Text('Fiona Yovita Syafri',
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                  Row(
                    children: <Widget>[
                      Icon(Icons.email, color: Colors.indigo),
                      SizedBox(width: 10),
                      Text(
                        'fionayovita2311@gmail.com',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.person, color: Colors.amberAccent),
                      SizedBox(width: 10),
                      Text(
                        'Mahasiswa',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.emoji_events, color: Colors.redAccent),
                      SizedBox(width: 10),
                      Text(
                        'Event Participated: 5',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  )
                ]),
          )
        ],
      ),
    );
  }
}
