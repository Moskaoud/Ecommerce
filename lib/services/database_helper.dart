import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/customer.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'customer_database.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE customers(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT NOT NULL,
        phone TEXT NOT NULL,
        address TEXT NOT NULL,
        createdAt TEXT NOT NULL
      )
    ''');
  }

  // Insert a single customer
  Future<int> insertCustomer(Customer customer) async {
    final db = await database;
    return await db.insert('customers', customer.toMap());
  }

  // Insert multiple customers using batch
  Future<void> insertCustomersBatch(List<Customer> customers) async {
    final db = await database;
    final batch = db.batch();

    for (var customer in customers) {
      batch.insert('customers', customer.toMap());
    }

    await batch.commit(noResult: true);
  }

  // Insert a single customer using transaction
  Future<int> insertCustomerTransaction(Customer customer) async {
    final db = await database;
    int result = 0;

    await db.transaction((txn) async {
      result = await txn.insert('customers', customer.toMap());
    });

    return result;
  }

  // Get all customers
  Future<List<Customer>> getAllCustomers() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('customers');

    return List.generate(maps.length, (i) {
      return Customer.fromMap(maps[i]);
    });
  }

  // Get a single customer by id
  Future<Customer?> getCustomerById(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'customers',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Customer.fromMap(maps.first);
    } else {
      return null;
    }
  }

  // Query customers with specific conditions
  Future<List<Customer>> queryCustomers({
    String? name,
    String? email,
    String? phone,
  }) async {
    final db = await database;
    String whereClause = '';
    List<dynamic> whereArgs = [];

    if (name != null && name.isNotEmpty) {
      whereClause += 'name LIKE ?';
      whereArgs.add('%$name%');
    }

    if (email != null && email.isNotEmpty) {
      if (whereClause.isNotEmpty) whereClause += ' AND ';
      whereClause += 'email LIKE ?';
      whereArgs.add('%$email%');
    }

    if (phone != null && phone.isNotEmpty) {
      if (whereClause.isNotEmpty) whereClause += ' AND ';
      whereClause += 'phone LIKE ?';
      whereArgs.add('%$phone%');
    }

    final List<Map<String, dynamic>> maps = await db.query(
      'customers',
      where: whereClause.isNotEmpty ? whereClause : null,
      whereArgs: whereArgs.isNotEmpty ? whereArgs : null,
    );

    return List.generate(maps.length, (i) {
      return Customer.fromMap(maps[i]);
    });
  }

  // Update customer
  Future<int> updateCustomer(Customer customer) async {
    final db = await database;
    return await db.update(
      'customers',
      customer.toMap(),
      where: 'id = ?',
      whereArgs: [customer.id],
    );
  }

  // Delete customer
  Future<int> deleteCustomer(int id) async {
    final db = await database;
    return await db.delete('customers', where: 'id = ?', whereArgs: [id]);
  }

  // Close database
  Future<void> close() async {
    final db = await database;
    await db.close();
  }
}



