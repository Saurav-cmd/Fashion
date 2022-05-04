import 'package:fashion_paints/models/database_models/color_base_database_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/database_models/book_marked_model.dart';
import '../models/database_models/colorant_database_model.dart';
import '../models/database_models/doubled_fencee_database_ model.dart';
import '../models/database_models/saved_model.dart';
import '../models/database_models/shade_color_database_model.dart';

class DatabaseHelper{
  static const _databaseVersion = 5;
  static const table1 = "DoubleFenceee";
  static const table2 = "ColorBase";
  static const table3 = "ColorColorant";
  static const table4 = "ShadeColor";
  static const table5 = "BookMarked";
  static const table6 = "Saved";

  //this is for Double Fenceee table.........................................................
  static const id = 'id';
  static const colorName = 'colorName';
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


  //This is for Color Base Table starts here....................................................
  static const columnId = "id";
  static const baseId = "bId";
  static const cBase = "base";
  static const unitPrice1 = "unitPrice1";
  static const unitPrice2 = "unitPrice2";
  static const unitPrice3 = "unitPrice3";
  static const unitPrice4 = "unitPrice4";
  static const kgLtrFlag = "kgLtrFlag";
  //This is for Color Base Table ends here......................................................

  //This is for Color Colorant table Starts here...............................................
  static const colorantColumnId = "columnId";
  static const colorId = "id";
  static const colorantName = "colorantName";
  static const colorantCode = "colorantCode";
  static const unitPrice = "unitPrice";
  static const rValue = "rValue";
  static const gValue = "gValue";
  static const bValue = "bValue";
  static const createdAt = "createdAt";
  static const updatedAt = "updatedAt";
  //This is for Color Colorant table ends here.................................................

  //This is for Shade Color table starts here..................................................
  static const shadeColorColumnId ="columnId";
  static const sCId = "id";
  static const sId = "sId";
  static const sColorCode = "colorCode";
  static const sColorName = "colorName";
  static const doubleDefenceEe = "doubleDefenceEe";
  static const elegaIe = "elegaIe";
  static const newBarpimoIe = "newBarpimoIe";
  static const newShangrilaEe = "newShangrilaEe";
  static const newShangrilaIe = "newShangrilaIe";
  static const newUltraProtecEe = "newUltraProtecEe";
  static const protecEe = "protecEe";
  static const relianceDist = "relianceDist";
  static const shangrilaDist = "shangrilaDist";
  static const sRValue = "rValue";
  static const sGValue = "gValue";
  static const sBValue = "bValue";
  //This is for Shade Color table ends here....................................................

  //This is for BookMarked table starts here...................................................
  static const bookMarkedColmId = "id";
  static const bookMarkedFandeckId = "fandeckId";
  static const bookMarkedColorName = "colorName";
  static const bookMarkedColorCode = "colorCode";
  static const bookMarkedProductName = "productName";
  static const bookMarkedFandeckName = "fandeckName";
  static const bookMarkedCanSize = "canSize";
  static const canColorR = "canColorR";
  static const canColorG = "canColorG";
  static const canColorB = "canColorB";
  //This is for BookMarked table ends here......................................................

  //This is for Saved table starts here.........................................................
  static const savedColumnId = "id";
  static const savedCustomerName = "customerName";
  static const savedCustomerAddress = "address";
  static const savedCustomerContact = "contact";
  static const savedColorName = "colorName";
  static const savedColorCode = "colorCode";
  static const savedProductName = "productName";
  static const savedCanSize = "canSize";
  static const savedFandeckId = "fandeckId";
  static const savedRColor = "rColor";
  static const savedGColor = "gColor";
  static const savedBColor = "bColor";
  //This is for Saved table ends here.........................................................

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
    print("This is database path $dbpath");
    return dbpath;
  }

  Future<void> cleanDatabase()async{
    final db = await instance.database;
    if(table1.isNotEmpty){
      db?.delete(table1);
    }
  }
  Future _onCreate(Database db, int version) async {
    //class Double defeence table........................................................
    await db.execute('''
  CREATE TABLE $table1(
    $id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    $colorName TEXT,
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

    //Color Base Table......................................................................
    await db.execute('''
  CREATE TABLE $table2(
    $columnId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    $baseId INTEGER,
    $cBase TEXT,
    $unitPrice1 REAL,
    $unitPrice2 REAL,
    $unitPrice3 REAL,
    $unitPrice4 REAL,
    $kgLtrFlag REAL
  )
  ''').then((value) => null);

    //Color Colorant Table......................................................................
    await db.execute('''
  CREATE TABLE $table3(
    $colorantColumnId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    $colorId  INTEGER,
    $colorantName  TEXT,
    $colorantCode  REAL,
    $unitPrice  REAL,
    $rValue  REAL,
    $gValue  REAL,
    $bValue  REAL,
    $createdAt DATETIME,
    $updatedAt DATETIME
  )
  ''').then((value) => null);

    await db.execute('''
  CREATE TABLE $table4(
    $shadeColorColumnId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    $sCId INTEGER,
    $sId INTEGER,
    $sColorCode TEXT,
    $sColorName REAL,
    $doubleDefenceEe REAL,
    $elegaIe REAL,
    $newBarpimoIe REAL,
    $newShangrilaEe REAL,
    $newShangrilaIe REAL,
    $newUltraProtecEe REAL,
    $protecEe REAL,
    $relianceDist REAL,
    $shangrilaDist REAL,
    $sRValue REAL,
    $sGValue REAL,
    $sBValue REAL
  )
  ''').then((value) => null);

    await db.execute('''
       CREATE TABLE $table5(
        $bookMarkedColmId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        $bookMarkedFandeckId INTEGER,
        $bookMarkedColorName TEXT,
        $bookMarkedColorCode TEXT,
        $bookMarkedProductName TEXT,
        $bookMarkedFandeckName TEXT,
        $bookMarkedCanSize REAL,
        $canColorR REAL,
        $canColorG REAL,
        $canColorB REAL
       )
    ''').then((value) => null);

    await db.execute('''
      CREATE TABLE $table6(
        $savedColumnId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        $savedCustomerName TEXT,
        $savedCustomerAddress TEXT,
        $savedCustomerContact TEXT,
        $savedColorName TEXT,
        $savedColorCode TEXT,
        $savedProductName TEXT,
        $savedCanSize REAL,
        $savedFandeckId REAL,
        $savedRColor REAL,
        $savedGColor REAL,
        $savedBColor REAL
      )
    ''').then((value) => null);
  }

  //double defence ko data add,query,all data get ya bata start ho hai................................................................
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

 /* double defence database ma query laga ko baseId lina lai and color code ko value matra aaxa vhane color code le query garne haina vhane color
  Name le matra query garne*/
  Future<List<DoubleDefenceee>> queryDoubleDefence(String? productName,double? fanDeckId,String? colorCodeOrName)async{
    Database? db = await instance.database;
    var data = await  db?.query(table1,where:'$fanDeck=? and $colorName=?',whereArgs: [fanDeckId,colorCodeOrName]);
    return data!.isNotEmpty?data.map((c) => DoubleDefenceee.fromMap(c)).toList():[];
  }
  //double defence ko data add,query,all data get ya bata end ho hai................................................................


  //color Base ko data add,all data get ya bata start ho hai........................................................................
  Future<int?> addColorBaseData(DatabaseColorBase colorBase) async{
    Database? db = await instance.database;
    return await db?.insert(table2, colorBase.toMap());
  }

  Future<List<DatabaseColorBase>> getColorBaseData() async{
    Database? db = await instance.database;
    var data = await db?.query(table2);
    List<DatabaseColorBase>? colorBaseDataList = data!.isNotEmpty?data.map((e) => DatabaseColorBase.fromMap(e)).toList():[];
    return colorBaseDataList;
  }
  //color Base ko data add,all data get ya bata end ho hai........................................................................


  //color colorant ko data add,query,all data get ya bata start ho hai........................................................................
  Future<int?> addColorColorantData(Colorants colorColorants) async{
    Database? db = await instance.database;
    return await db?.insert(table3, colorColorants.toMap());
  }


  Future<List<Colorants>> queryColorantsColor(String? colorantCodeOrName)async{
    Database? db = await instance.database;
    var data = await  db?.query(table3,where:'$colorantCode=?',whereArgs: [colorantCodeOrName]);
    return data!.isNotEmpty?data.map((c) => Colorants.fromMap(c)).toList():[];
  }

  Future<List<Colorants>> getColorColorantData() async{
    Database? db = await instance.database;
    var data = await db?.query(table3);
    List<Colorants>? colorColorantsDataList = data!.isNotEmpty?data.map((e) => Colorants.fromMap(e)).toList():[];
    return colorColorantsDataList;
  }
  //color colorant ko data add,query,all data get ya bata end ho hai........................................................................


  //shade color ko data add,query,all data get ya bata start ho hai........................................................................
  Future<int?> addShadeColorData(ShadeColorDatabase shadeColor) async{
    Database? db = await instance.database;
    return await db?.insert(table4, shadeColor.toMap());
  }

  Future<List<ShadeColorDatabase>> getShadeColorData() async{
    Database? db = await instance.database;
    var data = await db?.query(table4);
    List<ShadeColorDatabase>? shadeColorDataList = data!.isNotEmpty?data.map((e) => ShadeColorDatabase.fromMap(e)).toList():[];
    return shadeColorDataList;
  }

  Future<List<ShadeColorDatabase>> queryShadeColor(String? colorName)async{
    Database? db = await instance.database;
    var data =  await db?.query(table4,where:'$sColorName=?',whereArgs: [colorName]);
    return data!.isNotEmpty?data.map((e) => ShadeColorDatabase.fromMap(e)).toList():[];
  }
  //shade color ko data add,query,all data get ya bata end ho hai........................................................................

  //Book Marked ko data add,get garne ya bata start ho..................................................................................
  Future<int?> addBookMarkedData(BookMarked bookMarked)async{
      Database? db = await instance.database;
      return await db?.insert(table5, bookMarked.toMap());
  }

  Future<List<BookMarked>> getBookMarkedData()async{
    Database? db = await instance.database;
    var data =await db?.query(table5);
    List<BookMarked>? bookMarkedDataList = data!.isNotEmpty?data.map((e) => BookMarked.fromMap(e)).toList():[];
    return bookMarkedDataList;
  }

  Future<int?> updateBookMarkedData(BookMarked bookMarked,id)async{
    Database? db =await instance.database;
    return await db?.update(table5,bookMarked.toMap(),where: "$bookMarkedColmId=?",whereArgs: [id]);
  }
  //Book Marked ko data add,get garne ya bata end ho.........................................................................................

  //Saved ko data add,get garne ya bata start ho hai.........................................................................................
  Future<int?> addSavedData(Saved saved)async{
    Database? db = await instance.database;
    return await db?.insert(table6, saved.toMap());
  }

  Future<List<Saved>> getSavedData()async{
    Database? db = await instance.database;
    var data = await db?.query(table6);
    List<Saved> savedDataList = data!.isNotEmpty?data.map((e) => Saved.fromMap(e)).toList():[];
    return savedDataList;
  }
  //Saved ko data add,get garne ya bata end ho hai.........................................................................................

}
