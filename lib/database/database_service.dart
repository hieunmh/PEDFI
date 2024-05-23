import 'package:path/path.dart';
import 'package:pedfi/model/category_model.dart';
import 'package:sqflite/sqflite.dart';

const String fileName = 'pedfidatabase.db';
const String categories = 'categories';
const String transactions = 'transactions';
const String wallets = 'wallets';



class DatabaseService {
  DatabaseService._init();

  static final DatabaseService instance = DatabaseService._init();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initializeDB(fileName);

    return _database!;
  }

  Future<Database> _initializeDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS $categories (
        id TEXT PRIMARY KEY NOT NULL,
        type TEXT NOT NULL,
        name TEXT NOT NULL,
        description TEXT,
        priority INTEGER,
        created_at DATETIME DEFAULT (DATETIME('now')),
        image TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS $transactions (
        id TEXT PRIMARY KEY NOT NULL,
        description TEXT NOT NULL,
        date DATETIME DEFAULT (DATETIME('now')),
        value INTEGER,
        category_id TEXT NOT NULL,
        is_notified BOOLEAN NOT NULL CHECK (is_notified IN (0, 1)),
        user_id TEXT,
        wallet_id TEXT,
        FOREIGN KEY (category_id) REFERENCES $categories (id),
        FOREIGN KEY (wallet_id) REFERENCES $wallets (id)
      )
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS $wallets (
        id TEXT PRIMARY KEY NOT NULL,
        name TEXT NOT NULL,
        value INTEGER NOT NULL,
        created_at DATETIME DEFAULT (DATETIME('now'))
      )
    ''');
  }

  Future<int> createCategory(Category category) async {
    final db = await instance.database;
    final id = await db.insert(categories, category.toJson());

    return id;
  }

  Future<List<Category>> getAllCategory() async {
    final db = await instance.database;
    final result = await db.query(categories);

    final dbpath = await getDatabasesPath();
    print(dbpath);

    return  result.map((json) => Category.fromJson(json)).toList();
  }

  Future<void> close() async {
    final db = await instance.database;
    return db.close();
  }

}