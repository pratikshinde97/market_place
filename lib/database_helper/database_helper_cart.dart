import 'package:market_place/model/cart_list.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DatabaseHelperCart {
  static DatabaseHelperCart _databaseHelper;    // Singleton DatabaseHelper
  static Database _database;                // Singleton Database

  String noteTable = 'note_table';
  String colId = 'id';
  String colProductName = 'productName';
  String colProductImageName = 'productImageName';
  String colMrp = 'mrp';
  String colOurPrice = 'ourPrice';
  String colUnitQuantity = 'unitQuantity';
  String colQuantity ='quantity';
  String colProductId = 'productId';

  DatabaseHelperCart._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DatabaseHelperCart() {

    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelperCart._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }

  Future<Database> get database async {

    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';

    // Open/create the database at a given path
    var notesDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  void _createDb(Database db, int newVersion) async {

    await db.execute('CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colProductName TEXT, '
        '$colProductImageName TEXT, $colMrp TEXT, $colOurPrice TEXT, $colUnitQuantity TEXT, $colQuantity TEXT, $colProductId TEXT)');
  }

  // Fetch Operation: Get all note objects from database
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result = await db.query(noteTable);
    return result;
  }

  // Insert Operation: Insert a Note object to database
  Future<int> insertNote(CartList note) async {
    Database db = await this.database;
    var result = await db.insert(noteTable, note.toMap());
    return result;
  }

  // Update Operation: Update a Note object and save it to database
  Future<int> updateNote(CartList note) async {
    var db = await this.database;
    var result = await db.update(noteTable, note.toMap(), where: '$colId = ?', whereArgs: [note.id]);
    return result;
  }

  // Delete Operation: Delete a Note object from database
  Future<int> deleteNote(int id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $noteTable WHERE $colId = $id');
    return result;
  }

  // Get number of Note objects in database
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $noteTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
  Future<List<CartList>> getNoteList() async {

    var noteMapList = await getNoteMapList(); // Get 'Map List' from database
    int count = noteMapList.length;         // Count the number of map entries in db table

    List<CartList> noteList = List<CartList>();
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      noteList.add(CartList.fromMapObject(noteMapList[i]));
    }

    return noteList;
  }
  void updateProduct(String newVal, String productId) async {
    try{
      var dbClient = await database;
      await dbClient.rawUpdate('''
    UPDATE $noteTable
    SET  $colQuantity= ?
    WHERE  $productId= ?
    ''', [newVal, productId]);
      print(newVal);
      print(productId);
    }
    catch(e){
      print(e);
    }
  }

}