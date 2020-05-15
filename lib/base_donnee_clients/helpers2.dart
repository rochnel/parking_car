import 'package:parking_car/base_donnee_clients/Clients.dart';
import 'package:parking_car/base_donnee_clients/utils.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io' as io;
import 'package:sqflite/sqflite.dart';

class Helper1{
  static final Helper1 _instance = new Helper1.internal();
  static final _databaseName = "MyDatabases.db";
  factory Helper1() => _instance;

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
        create table $tableClient(
          $columnId integer primary key autoincrement, 
          $columnNom text not null,
          $columnTel text not null,
          $columnCni text not null,
          $columnMarque text not null,
          $columnImatriculation text not null,
          $columnJour text not null,
          $columnPlace text not null,
          $columnPrix text not null,
          $columnHeure DATETIME)
      ''');
    });
    return theDb;
  }
  Helper1.internal();

  Future<Client> insert(Client client) async{
    var dbClient = await db;
    client.id = await dbClient.insert(tableClient, client.toMap());
    return client;
  }

  Future<Client> getClient(int id) async{
    var dbClient = await db;
    List<Map> maps = await dbClient.query(tableClient,
        columns: [columnId, columnNom, columnTel, columnCni, columnMarque, columnImatriculation, columnJour, columnPlace, columnPrix, columnHeure],
        where: '$columnId = ?',
        whereArgs: [id]
    );
    if(maps.length > 0){
      return Client.fromMap(maps.first);
    }
    return null;
  }
  Future<int> delete(int id) async{
    var dbClient = await db;
    return await dbClient.delete(tableClient, where: '$columnId = ?', whereArgs: [id]);
  }
  Future<int> update(Client client) async{
    var dbClient = await db;
    return await dbClient.update(tableClient, client.toMap(),
        where: '$columnId = ?', whereArgs: [client.id]
    );
  }
  Future<List> getAllClients() async{
    List<Client> client = List();
    var dbClient = await db;
    List<Map> maps = await dbClient.query(tableClient,
        columns: [columnId, columnNom, columnTel, columnCni, columnMarque, columnImatriculation, columnJour, columnPlace, columnPrix, columnHeure]
    );
    if(maps.length > 0) {
      maps.forEach((f) {
        client.add(Client.fromMap(f));
      });
    }
    return client;
  }

  Future close() async{
    var dbClient = await db;
    dbClient.close();
  }
}