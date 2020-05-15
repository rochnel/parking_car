import 'dart:io';
import 'package:parking_car/base_donnee_inscription/utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io' as io;
import 'package:parking_car/base_donnee_inscription/login.dart';

class Helper{
  static final Helper _instance = new Helper.internal();
  static final _databaseName = "Database.db";
  factory Helper() => _instance;

  static Database _db;
  Future<Database> get db async{
    if(_db != null)
      return _db;
    _db = await initDb();
    return _db;
  }
  initDb() async{
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    var theDb = await openDatabase(path, version: 1, onCreate: (Database db, int version) async{
      await db.execute('''
              CREATE TABLE $tableLogin (
                $columnId INTEGER PRIMARY KEY,
                $columnNom TEXT NOT NULL,
                $columnGarderie TEXT NOT NULL,
                $columnPassword1 TEXT NOT NULL,
                $columnPassword2 TEXT NOT NULL
              )
              ''');
    });
    return theDb;
  }
  Helper.internal();

  Future<int> insert(Login login) async{
    var dbClient = await db;
    int id = await dbClient.insert(tableLogin, login.toMap());
    return id;
  }

  Future<Login> getRegistre(int id) async{
    var dbClient = await db;
    List<Map> maps = await dbClient.query(tableLogin,
        columns: [columnId, columnNom, columnGarderie, columnPassword1, columnPassword2],
        where: '$columnId = ?',
        whereArgs: [id]
    );
    if(maps.length > 0){
      return Login.fromMap(maps.first);
    }
    return null;
  }
  Future close() async{
    var dbClient = await db;
    dbClient.close();
  }
}
