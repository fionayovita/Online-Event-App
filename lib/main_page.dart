import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_event/detail_webinar.dart';
import 'package:online_event/model/webinar_data.dart';
import 'package:online_event/profile_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 700) {
            return MainPageMobile();
          } else if (constraints.maxWidth <= 1000) {
            return MainPageGrid();
          } else {
            return MainPageGrid();
          }
        },
      ),
    ));
  }
}

class MainPageMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Color(0xFFF55446)),
            height: 200,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Explore',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold)),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ProfilePage();
                      }));
                    },
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/profile.JPG'),
                    ),
                  )
                ],
              )),
          Container(
            margin: EdgeInsets.only(top: 70),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 120,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Color(0xFFF55446),
                            borderRadius: BorderRadius.circular(50)),
                        alignment: Alignment.center,
                        child: Text(
                          'Popular',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(height: 8),
                      PopularList()
                    ],
                  )),
                  SizedBox(height: 30),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 120,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Color(0xFFF55446),
                              borderRadius: BorderRadius.circular(50)),
                          alignment: Alignment.center,
                          child: Text(
                            'Event',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(height: 8),
                        EventList()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MainPageGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Color(0xFFF55446)),
            height: 200,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Explore',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold)),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ProfilePage();
                      }));
                    },
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/profile.JPG'),
                    ),
                  )
                ],
              )),
          Container(
            margin: EdgeInsets.only(top: 70),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 120,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Color(0xFFF55446),
                            borderRadius: BorderRadius.circular(50)),
                        alignment: Alignment.center,
                        child: Text(
                          'Popular',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(height: 8),
                      PopularGrid(gridCount: 3)
                    ],
                  )),
                  SizedBox(height: 30),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 120,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Color(0xFFF55446),
                              borderRadius: BorderRadius.circular(50)),
                          alignment: Alignment.center,
                          child: Text(
                            'Event',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(height: 8),
                        LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            if (constraints.maxWidth <= 1200) {
                              return EventGrid(gridCount: 4);
                            } else {
                              return EventGrid(gridCount: 6);
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PopularList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final WebinarData webinar = webinarList[index];

        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailPageWebinar(webinar: webinar);
            }));
          },
          child: Card(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 170,
                  height: 170,
                  child: Image.asset(webinar.imageAsset, fit: BoxFit.cover),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            webinar.name,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_forward_ios, color: Color(0xFFF55446)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
        );
      },
      itemCount: 3,
    );
  }
}

class EventList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final WebinarData webinar = webinarList[index];

        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailPageWebinar(webinar: webinar);
            }));
          },
          child: Card(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 170,
                  height: 170,
                  child: Image.asset(webinar.imageAsset, fit: BoxFit.cover),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            webinar.name,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_forward_ios, color: Color(0xFFF55446)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
        );
      },
      itemCount: webinarList.length,
    );
  }
}

class EventGrid extends StatelessWidget {
  final int gridCount;
  EventGrid({required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: gridCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: webinarList.map((place) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailPageWebinar(
                  webinar: place,
                );
              }));
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Image.asset(place.imageAsset, fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            place.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 13.0, fontFamily: 'Poppins'),
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_forward_ios, color: Color(0xFFF55446)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class PopularGrid extends StatelessWidget {
  final int gridCount;
  PopularGrid({required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: gridCount,
        crossAxisSpacing: 50,
        mainAxisSpacing: 40,
        children: popularList.map((place) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailPageWebinar(
                  webinar: place,
                );
              }));
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Image.asset(place.imageAsset, fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            place.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 13.0, fontFamily: 'Poppins'),
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_forward_ios, color: Color(0xFFF55446)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
