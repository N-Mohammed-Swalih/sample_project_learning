import 'package:sqflite/sqflite.dart' as sql;

class SQLHelperAssignment {
  //database creation
  static Future<sql.Database> createDB() async {
    return sql.openDatabase("users.db", version: 1,
        onCreate: (sql.Database database, int version) async {
      //creating table
      await createTable(database);
    });
  }

//to save the account details to the table
  static Future<int> create_user(
      String name, String mail, String phonenumber, String password) async {
    final db = await SQLHelperAssignment.createDB();
    final data = {
      'accname': name,
      'accmail': mail,
      'pass': password,
      'phone': phonenumber
    };
    final id = await db.insert('users', data);
    return id;
  }

  //to create a table
  static Future<void> createTable(sql.Database database) async {
    await database.execute("""CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        accname TEXT,
        accmail TEXT,
        phone TEXT,
        pass TEXT
      )""");
  }

  static Future<List<Map>> CheckLogin(String username, String password) async {
    final db = await SQLHelperAssignment.createDB();
final data = await db.rawQuery(
    "SELECT * FROM users WHERE accmail= '$username' AND pass = '$password' ");
    print(data.toString());
    if (data.isNotEmpty) {
      return data;
    }
    return data;
  }
}
