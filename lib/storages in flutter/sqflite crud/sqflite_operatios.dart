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
  static Future<int> create_contact(String name, String phonenumber) async {
    final db = await SQLHelper.createDB();
    final data = {'cname': name, 'cnumber': phonenumber};
    final id = await db.insert('contacts', data);
    return id;
  }

  //table for storing the values in this database
  static Future<void> createTable(sql.Database database) async {
    await database.execute("""CREATE TABLE mycontacts(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        cname TEXT,
        cnumber TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )""");
  }
}
