import 'package:curving_reality_library/enums/db_column_type.dart';
import 'package:curving_reality_library/models/db_table.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

typedef ToMap<T> = Map<String, dynamic> Function(T value);
typedef FromMap<T> = T Function(Map<String, dynamic> map);

class CuReSqlService<T> {
  static Database? database;

  Future<void> initDatabase(
      String dbName, List<CuReDatabaseTable> tables) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, '$dbName.db');
    database = await openDatabase(path,
        version: 1, onCreate: (db, version) => _onCreate(db, version, tables));
  }

  Future<void> _onCreate(
      Database db, int version, List<CuReDatabaseTable> tables) async {
    for (var table in tables) {
      String sql = 'CREATE TABLE IF NOT EXISTS ${table.name} (';
      for (var i = 0; i < table.columns.length; i++) {
        sql += _columnBuilder(table.columns[i]);
        if (i < table.columns.length - 1) {
          sql += ', ';
        }
      }
      sql += ')';
      await db.execute(sql);
    }
  }

  Future<void> deleteDatabaseFile(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, '$dbName.db');
    await deleteDatabase(path);
  }

  Future<int> insert(
    String tableName,
    Map<String, dynamic> data,
  ) async {
    final dataWithoutId = Map<String, dynamic>.from(data)..remove('id');
    return await database!.insert(tableName, dataWithoutId);
  }

  Future<List<Map<String, dynamic>>> getAll(String tableName,
      {String orderBy = 'id DESC'}) async {
    final result = await database!.query(tableName, orderBy: orderBy);
    return result.toList();
  }

  Future<T?> getById(String tableName, int id, FromMap<T> fromMap) async {
    final result =
        await database!.query(tableName, where: 'id = ?', whereArgs: [id]);
    if (result.isNotEmpty) {
      return fromMap(result.first);
    }
    return null;
  }

  Future<int> update(int id, String tableName, T item, ToMap<T> toMap) async {
    final data = toMap(item)..remove('id');
    return await database!
        .update(tableName, data, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> delete(String tableName, int id) async {
    return await database!.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> close() async {
    await database?.close();
  }

  String _columnBuilder(CuReDatabaseTableColumn column) {
    String result = '${column.name} ';

    // Type
    switch (column.type) {
      case CuReDatabaseColumnType.integer:
        result += 'INTEGER';
        break;
      case CuReDatabaseColumnType.double:
        result += 'DOUBLE';
        break;
      case CuReDatabaseColumnType.text:
        result += 'TEXT';
        break;
      case CuReDatabaseColumnType.boolean:
        result += 'BOOLEAN';
        break;
    }

    // Constraints
    if (column.isPrimaryKey) {
      result += ' PRIMARY KEY';
    }

    // Auto Increment
    if (column.isAutoIncrement) {
      result += ' AUTOINCREMENT';
    }

    // Nullable
    if (column.isNotNull) {
      result += ' NOT NULL';
    }

    // Default Value
    if (column.defaultValue != null) {
      result += ' DEFAULT ${column.defaultValue}';
    }

    return result;
  }
}
