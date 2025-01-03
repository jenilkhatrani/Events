import 'package:firebase/models/event_model.dart';
import 'package:firebase/utils/helpers/firestore_helper.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper dbHelper = DBHelper._();

  Database? db;

  // Initialize the SQLite database
  initDB() async {
    String dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, 'event.db');
    db = await openDatabase(path, version: 1, onCreate: (db, version) {
      String query = """CREATE TABLE IF NOT EXISTS events(
     id INTEGER PRIMARY KEY AUTOINCREMENT,
     title TEXT NOT NULL,
     date TEXT NOT NULL,
     description TEXT NOT NULL)""";
      db.execute(query);
      print("==========================");
      print("Database created");
      print("==========================");
    });
  }

  Future<int> addEvent(EventModel event) async {
    await initDB();

    String query =
        "INSERT INTO events(title, date, description) VALUES (?,?,?)";
    List args = [event.title, event.date, event.description];

    int result = await db!.rawInsert(query, args);

    FireStoreHelper.fireStoreHelper.addEventToFirestore(event);

    return result;
  }

  Future<List<EventModel>> fetchEvents() async {
    await initDB();
    String query = "SELECT * FROM events";
    final List<Map<String, dynamic>> maps = await db!.rawQuery(query);

    return List.generate(maps.length, (i) {
      return EventModel.fromMap(maps[i]);
    });
  }

//
// Future<List<EventModel>> fetchEventsFromFirestore() async {
//   try {
//     QuerySnapshot querySnapshot = await firebaseFirestore
//         .collection('events')
//         .get();
//
//     return querySnapshot.docs.map((doc) {
//       return EventModel.fromMap(doc.data() as Map<String, dynamic>);
//     }).toList();
//   } catch (e) {
//     print("Error fetching events from Firestore: $e");
//     return [];
//   }
// }
}
