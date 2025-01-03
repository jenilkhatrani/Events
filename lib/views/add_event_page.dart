import 'package:firebase/models/event_model.dart';
import 'package:firebase/view_model/event_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Add your event ",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      )),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  spacing: 20,
                  children: [
                    TextFormField(
                      controller: titleController,
                      decoration: InputDecoration(
                          labelText: "Enter Event",
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null) {
                          return "Enter a event title";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      controller: dateController,
                      decoration: InputDecoration(
                          labelText: "Enter Date 00-00-0000",
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == null) {
                          return "Enter a event date";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                          labelText: "Enter Description",
                          border: OutlineInputBorder()),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();

                          EventModel eventModel = EventModel(
                              title: titleController.text,
                              date: dateController.text,
                              description: descriptionController.text);

                          Provider.of<EventViewModel>(context, listen: false)
                              .addEvent(eventModel);

                          Get.offNamed('/home_page');
                        }
                      },
                      child: Text("add event"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
