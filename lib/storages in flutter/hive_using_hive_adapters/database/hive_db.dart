//singleton class

import 'package:hive_flutter/hive_flutter.dart';

import '../models/user_model.dart';

class HiveDb {
  HiveDb.internal();

  static HiveDb instance = HiveDb.internal();

//factory constructor for creating singleton class
  factory HiveDb() {
    return instance; //(these class have only one instance)
  }

//add user email and password to the hive database

  Future<void> addUser(User user) async {
    final db = await Hive.openBox<User>('userData');
    db.put(user.id, user);
  }

//read the user datas from hive db

  Future<List<User>> getUser() async {
    final db = await Hive.openBox<User>('userData');
    return db.values.toList();

    ///convert box values into list of users (because it is a map)
  }
}
