import 'package:firebase/models/event_model.dart';
import 'package:firebase/utils/helpers/db_helper.dart';
import 'package:flutter/material.dart';

class EventViewModel extends ChangeNotifier {
  List<EventModel> eventList = [];

  Future<List<EventModel>> fetchEvents() async {
    eventList = await DBHelper.dbHelper.fetchEvents();
    return eventList;
  }

  addEvent(EventModel event) async {
    await DBHelper.dbHelper.addEvent(event);
    eventList.add(event);
    notifyListeners();
  }
}
