import 'package:firebase/models/event_model.dart';
import 'package:firebase/utils/helpers/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  EventModel? selectedEvent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Event List"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // FutureBuilder to load events from DB and Firestore
            Expanded(
              child: FutureBuilder<List<EventModel>>(
                future: DBHelper.dbHelper.fetchEvents(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No events available.'));
                  }

                  final eventList = snapshot.data!;

                  return ListView.builder(
                    itemCount: eventList.length,
                    itemBuilder: (context, index) {
                      final event = eventList[index];

                      return Card(
                        elevation: 4,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          title: Text(event.title),
                          subtitle: Text(event.date),
                          onTap: () {
                            setState(() {
                              selectedEvent =
                                  event; // Update the selected event
                            });
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            if (selectedEvent != null) ...[
              SizedBox(height: 20),
              Text(
                selectedEvent!.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                selectedEvent!.date,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              SizedBox(height: 20),
              Text(
                "Description:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                selectedEvent!.description,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Get.offNamed('/add_event_page');
          }),
    );
  }
}
