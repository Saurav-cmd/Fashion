import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/database_models/doubled_fencee_database_ model.dart';

class DatabaseHelper{
  static const _databaseVersion = 5;
  static const table1 = "DoubleFenceee";

  //this is for Double Fenceee table.........................................................
  static const id = 'id';
  static const schoolId = 'colorName';
  static const colorCode = 'colorCode';
  static const xT = 'xT';
  static const tT = 'tT';
  static const lS = 'lS';
  static const mS = 'mS';
  static const rT = 'rT';
  static const fT = 'fT';
  static const kS = 'kS';
  static const mM = 'mM';
  static const rS = 'rS';
  static const vT = 'vT';
  static const pP = 'pP';
  static const zT= 'zT';
  static const mT= 'mT';
  static const lT= 'lT';
  static const uS= 'uS';
  static const sT= 'sT';
  static const base= 'base';
  static const bVolume= 'bVolume';
  static const fanDeck= 'fanDeck';
  static const formulation= 'formulation';
  //this is for  Double Fenceee table ends......................................................

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null){
      return _database;
    }
    _database = await _initDatabase();
    return _database;
  }
  var dbpath;
  String? dbpath1;
  var path;

  _initDatabase() async {
    path = await getDatabasesPath();
    dbpath1 = join(path,"FashionPaints.db");
    dbpath =  await openDatabase(dbpath1!,version: _databaseVersion, onCreate: _onCreate);
    return dbpath;
  }

  Future<void> cleanDatabase()async{
    final db = await instance.database;
    if(table1.isNotEmpty && table1!=null){
      db?.delete(table1);
    }
  }
  Future _onCreate(Database db, int version) async {
    //class subject table........................................................
    await db.execute('''
  CREATE TABLE $table1(
    $id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    $schoolId TEXT,
    $colorCode TEXT,
    $xT TEXT,
    $tT TEXT,
    $lS TEXT,
    $mS TEXT,
    $rT TEXT,
    $fT TEXT,
    $kS TEXT,
    $mM TEXT,
    $rS TEXT,
    $vT TEXT,
    $pP TEXT,
    $zT TEXT,
    $mT TEXT,
    $lT TEXT,
    $uS TEXT,
    $sT TEXT,
    $base REAL,
    $bVolume TEXT,
    $fanDeck REAL
  )
  ''').then((value) => null);
  }

  Future<int?> addDoubleFenceeData(DoubleDefenceee doubleFencee) async{
    Database? db = await instance.database;
    return await db?.insert(table1, doubleFencee.toMap());
  }

  Future<List<DoubleDefenceee>> getDoubleFenceeData() async{
    Database? db = await instance.database;
    var data = await db?.query(table1);
    List<DoubleDefenceee>? doubleFencedDataList = data!.isNotEmpty?data.map((c) => DoubleDefenceee.fromMap(c)).toList():[];
    return doubleFencedDataList;
  }
}
