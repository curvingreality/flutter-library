import 'package:curving_reality_library/enums/db_column_type.dart';

class CuReDatabaseTable {
  final String name;
  final List<CuReDatabaseTableColumn> columns;

  CuReDatabaseTable({required this.name, required this.columns});
}

class CuReDatabaseTableColumn {
  final String name;
  final CuReDatabaseColumnType type;
  final bool isPrimaryKey;
  final bool isAutoIncrement;
  final bool isNotNull;
  final dynamic defaultValue;

  CuReDatabaseTableColumn({
    required this.name,
    required this.type,
    this.isPrimaryKey = false,
    this.isAutoIncrement = false,
    this.isNotNull = false,
    this.defaultValue,
  });
}
