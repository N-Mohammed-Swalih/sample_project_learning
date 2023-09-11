import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  //database creation
  static Future<sql.Database> createDB() async {
    return sql.openDatabase("mycontacts.db", version: 1,
        onCreate: (sql.Database database, int version) async {
      //creating table
      await createTable(database);
    });
  }

//to save the name and phone number to contacts table
  static Future<void> create_contact(String name, String phonenumber) async {
    final db = await SQLHelper.createDB();
  }

  //table for storing the values in this database
  static Future<void> createTable(sql.Database database) async {
    await database.execute("""CREATE TABLE contacts(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      cname VARCHAR,
      cnumber VARCHAR,
    )""");
  }
}
