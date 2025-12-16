# Local database

---

The **sql service** reduces the complexity of using the **sqflite** plugin in order to speed up the development and simplify the code.

!> This service depends on the packages [sqflite](https://pub.dev/packages/sqflite) and [path](https://pub.dev/packages/path)

## Initialize database

```dart
CuReSqlService dbService = CuReSqlService();
await dbService.initDatabase('test_db', [
    CuReDatabaseTable(
        name: 'table_test',
        columns: [
            CuReDatabaseTableColumn(
                name: 'id',
                type: CuReDatabaseColumnType.integer,
                isAutoIncrement: true,
                isPrimaryKey: true,
            ),
            CuReDatabaseTableColumn(
                name: 'name',
                type: CuReDatabaseColumnType.text,
                isNotNull: true,
            ),
            CuReDatabaseTableColumn(
                name: 'balance',
                type: CuReDatabaseColumnType.double,
                isNotNull: true,
            ),
        ],
    ),
]);
```

## Delete database

```dart
CuReSqlService dbService = CuReSqlService();
await dbService.deleteDatabaseFile('test_db');
```

## Get all data in a table

```dart
CuReSqlService dbService = CuReSqlService();
final List<Map<String, dynamic>> wallets = await dbService.getAll('wallets');
```

## Get a row by ID

!> You need to have a **fromMap** method in your class in order to use this

```dart
CuReSqlService dbService = CuReSqlService();
final Wallet wallet = Wallet(id: 1, name: 'Wallet', balance: 20.0);
final List<Map<String, dynamic>> wallets = await dbService.getById('wallets', wallet.id, wallet.fromMap);
```

## Insert a table row

```dart
Map<String, dynamic> data = {
    "id": 1,
    "name": "Wallet",
    "balance": 20.0
};
CuReSqlService dbService = CuReSqlService();
await dbService.insert('wallets', data);
```

## Update table row

```dart
Map<String, dynamic> data = {
    "id": 1, // The ID used to update the data
    "name": "Wallet updated",
    "balance": 300.0
};
CuReSqlService dbService = CuReSqlService();
await dbService.update(data['id'], 'wallets', data, (item) => item);
```

## Delete a table row

```dart
CuReSqlService dbService = CuReSqlService();
final int id = 1;
await dbService.delete('wallets', id);
```
