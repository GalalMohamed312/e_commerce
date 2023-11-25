import 'package:ecommerce/model/cart_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../model/constance.dart';

class CartLocalDatabase {
  CartLocalDatabase._();

  static final CartLocalDatabase db = CartLocalDatabase._();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      print("have dataaaaaaaa");
      return _database;
    }
    try {
      _database = await initDB();
      print("not created dataaaaaaaa");
      return _database;
    } catch (e) {
      print("Error initializing database: $e");
      return null;
    }
    // _database = await initDB();
    // return _database;
  }

  initDB() async {
    print("Initializing the database...");
    String path = join(await getDatabasesPath(), cartDB);
    print("Database path: $path");
    return await openDatabase(path,
        version: 1,
        onCreate: (Database db, int version) async {
           await db.execute('''
      CREATE TABLE $tableCartProduct (
      $columnName TEXT NOT NULL,
      $columnPrice TEXT NOT NULL,
      $columnImage TEXT NOT NULL,
      $columnQuantity INTEGER NOT NULL,
      $columnId TEXT NOT NULL)
      ''').then((value){
        print("table created successfuly-----------------");
          }).catchError((onError){
            print("table exception**************$onError");
          });
        }
    );
  }

  insertDB(CartProductModel model) async {
    var dbClient = await database;
    try {
      await dbClient!.insert(tableCartProduct, model.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (onError) {
      print("Error inserting record: $onError");
    }
  }

  Future<List<CartProductModel>> getAllProducts() async {
    var dbClient = await database;
    try {
      List<Map<String, dynamic>> value = await dbClient!.query(tableCartProduct);
      List<CartProductModel> allProducts = value.isNotEmpty
          ? value.map((product) => CartProductModel.fromJson(product)).toList()
          : [];
      return allProducts;
    } catch (onError) {
      print("Error getting all records: $onError");
      return [];
    }
  }

  updateCartProduct(CartProductModel cartProductModel)async{
    var dbClient = await database;
    return await dbClient?.update(tableCartProduct, cartProductModel.toJson(),
    where: '$columnId = ?',whereArgs: [cartProductModel.id]
    );
  }

}