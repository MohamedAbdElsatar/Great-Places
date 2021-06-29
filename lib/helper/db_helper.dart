import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

class DBHelper {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'places.db'), version: 1,
        onCreate: (db, vertion) {
      return db.execute(
          'CREATE TABLE user_place (id TEXT PRIMARY KEY, title TEXT, image TEXT)');
    });
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final dbSql = await DBHelper.database();
    dbSql.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final dbSql = await DBHelper.database();
  
    return  dbSql.query(table);
  }

  static Future<void> deleteData(String table,String id)async{

    final dbSql = await DBHelper.database();

   await dbSql.delete(table,where:'id = ?',whereArgs: [id]);
  }
}
