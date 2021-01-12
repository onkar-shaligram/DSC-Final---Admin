import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class EditEvent extends StatefulWidget {
  DocumentSnapshot docToEdit;

  EditEvent({this.docToEdit});

  @override
  _EditEventState createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
  @override
  Widget build(BuildContext context) {
    TextEditingController titleTextEditingController =
        TextEditingController(text: widget.docToEdit.data()['title']);
    TextEditingController shortDescriptionTextEditingController =
        TextEditingController(
            text: widget.docToEdit.data()['short description']);
    TextEditingController descriptionTextEditingController =
        TextEditingController(text: widget.docToEdit.data()['description']);
    TextEditingController urlTextEditingController =
        TextEditingController(text: widget.docToEdit.data()['urlToEvent']);
    TextEditingController timeTextEditingController =
        TextEditingController(text: widget.docToEdit.data()['time']);
    TextEditingController priorityTextEditingController =
        TextEditingController(text: widget.docToEdit.data()['priority']);
    TextEditingController feedbackFormVisible = TextEditingController(
        text: widget.docToEdit.data()['FeedbackFormVisible']);
    TextEditingController feedbackFormUrlLink = TextEditingController(
      text: widget.docToEdit.data()['feedbackFormUrlLink']);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          FlatButton(
            onPressed: () {
              widget.docToEdit.reference
                  .delete()
                  .whenComplete(() => Navigator.pop(context));
            },
            child: Icon(Icons.delete),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.docToEdit.reference.update({
            'title': titleTextEditingController.text,
            'short description': shortDescriptionTextEditingController.text,
            'description': descriptionTextEditingController.text,
            'urlToEvent': urlTextEditingController.text,
            'time': timeTextEditingController.text,
            "priority": priorityTextEditingController.text,
            "FeedbackFormVisible": feedbackFormVisible.text,
            "feedbackFormUrlLink": feedbackFormUrlLink.text
          }).whenComplete(() => Navigator.pop(context));
        },
        child: Icon(Icons.save),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              TextField(
                controller: titleTextEditingController,
                decoration: InputDecoration(
                    hintText: "Enter title", labelText: 'Title'),
                maxLines: 2,
              ),
              TextField(
                controller: shortDescriptionTextEditingController,
                decoration: InputDecoration(
                  hintText: "Enter short description",
                  labelText: 'Short Description',
                ),
                maxLines: 2,
              ),
              TextField(
                controller: descriptionTextEditingController,
                decoration: InputDecoration(
                  hintText: "Enter description",
                  labelText: 'Description',
                ),
                maxLines: 4,
              ),
              TextField(
                controller: urlTextEditingController,
                decoration: InputDecoration(
                    hintText: "Enter URL to event", labelText: 'Event URL'),
                maxLines: 2,
              ),
              TextField(
                controller: timeTextEditingController,
                decoration: InputDecoration(
                    hintText: "Enter time", labelText: 'Time of Event'),
                maxLines: 2,
              ),
              TextField(
                controller: priorityTextEditingController,
                decoration: InputDecoration(
                    hintText: "Enter Priority Number",
                    labelText: 'Priority Level'),
                maxLines: 1,
              ),
              TextField(
                controller: feedbackFormUrlLink,
                decoration: InputDecoration(
                    hintText:
                        "feedbackForm Url Link",
                    labelText: 'feedbackForm Url Link'),
                maxLines: 1,
              ),
              TextField(
                controller: feedbackFormVisible,
                decoration: InputDecoration(
                    hintText:
                        "Enter true if you want to show feedback form on UI else false",
                    labelText: 'Feedback form visible?'),
                maxLines: 1,
              ),
              SizedBox(
                height: 350,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
