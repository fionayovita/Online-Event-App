import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_event/main_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/banner.jpg'), fit: BoxFit.cover),
            ),
          ),
          Container(
            decoration:
                BoxDecoration(color: Color(0xFF02569D).withOpacity(0.3)),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Make Your Days\nMore Productive!',
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                Text(
                  'Find online event here',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MainPage();
                    }));
                  },
                  child: Text('Get Started', style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFFF55446),
                      shadowColor: Colors.red,
                      fixedSize: Size(200, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
