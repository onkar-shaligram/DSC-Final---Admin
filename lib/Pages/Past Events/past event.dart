import 'package:admin/Pages/Past%20Events/add_event-past.dart';
import 'package:admin/views/edit_event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PastEvent extends StatefulWidget {
  @override
  _PastEventState createState() => _PastEventState();
}

class _PastEventState extends State<PastEvent> {

    final ref = FirebaseFirestore.instance.collection('past events').orderBy('priority', descending: false);
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Past Events'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddPastEvent()));
          },
          child: Icon(Icons.add)),
      body: StreamBuilder(
          stream: ref.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return ListView.builder(
                itemCount: snapshot.hasData ? snapshot.data.docs.length : 0,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditEvent(
                                    docToEdit: snapshot.data.docs[index],
                                  )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Card(
                          color: Colors.white24,
                          child: Container(
                            margin: EdgeInsets.all(20),
                            height: 320,
                            //color: Colors.grey[400],
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      snapshot.data.docs[index]
                                          .data()['imageUrl']
                                          .toString(),
                                      height: 120,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  snapshot.data.docs[index].data()['title'],
                                  style: TextStyle(fontSize: 20),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Short Description: ${snapshot.data.docs[index].data()['short description']}",
                                  style: TextStyle(fontSize: 13),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Feedback Form Visible: ${snapshot.data.docs[index].data()['FeedbackFormVisible']}",
                                  style: TextStyle(fontSize: 13),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Feedback Form Url Link: ${snapshot.data.docs[index].data()['feedbackFormUrlLink']}",
                                  style: TextStyle(fontSize: 13),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  snapshot.data.docs[index].data()['time'],
                                  style: TextStyle(fontSize: 13),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Priority : ${snapshot.data.docs[index].data()['priority']}",
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }),
    );
  }
}