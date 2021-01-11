import 'package:admin/Pages/Past%20Events/past%20event.dart';
import 'package:admin/Pages/Upcoming%20Events/upcoming%20event.dart';
import 'package:flutter/material.dart';

class TestHome extends StatefulWidget {
  @override
  _TestHomeState createState() => _TestHomeState();
}

class _TestHomeState extends State<TestHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Testing Home"),
      ),
      body: Container(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UpcomingEvent()));
              },
              child: Card(
                margin: EdgeInsets.all(20),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 55),
                  child: Center(
                      child: Text(
                    "Upcoming Events",
                    style: TextStyle(fontSize: 15),
                  )),
                ),
                elevation: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PastEvent()));
              },
              child: Card(
                margin: EdgeInsets.all(20),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 55),
                  child: Center(
                      child: Text(
                    "Past Events",
                    style: TextStyle(fontSize: 15),
                  )),
                ),
                elevation: 20,
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                  child: Text(
                "Sooner will add a button to convert Completed Event to Past Event. Since the app is under devlopment. Therefore added 'Create' for Past Events",
                style: TextStyle(color: Colors.black45),
              )),
            ),

            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                  child: Text(
                "*Priority is the way in which the document(of firestore) will be shown on the home screen. Preset to Ascending = true",
                style: TextStyle(color: Colors.black45),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
