import 'package:fashion_paints/models/database_models/color_base_database_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/database_models/book_marked_model.dart';
import '../models/database_models/colorant_database_model.dart';
import '../models/database_models/cosmetic_int_emulsion_database_model.dart';
import '../models/database_models/magnetic_ext_emulsion_model.dart';
import '../models/database_models/saved_customer_detail_color.dart';
import '../models/database_models/saved_customer_detail_model.dart';
import '../models/database_models/shade_color_database_model.dart';
import '../models/database_models/smart_dist_model.dart';
import '../models/database_models/style_dist_model.dart';
import '../models/database_models/weather_proof_extemulsion_model.dart';

class DatabaseHelper {
  static const _databaseVersion = 5;
  static const table1 = "CosmeticInteriorEmulsion";
  static const table2 = "ColorBase";
  static const table3 = "ColorColorant";
  static const table4 = "ShadeColor";
  static const table5 = "BookMarked";
  static const table6 = "SavedCustomerDetail";
  static const table7 = "SavedCustomerDetailColor";
  static const table8 = "WeatherProofExteriorEmulsion";
  static const table9 = "SmartDistemper";
  static const table10 = "MagnetExteriorEmulsion";
  static const table11 = "StyleDistemper";
  //this is for CosmeticInteriorEmulsion table.........................................................
  static const id = 'id';
  static const cosmeticId = "cosmeticId";
  static const colorName = 'colorName';
  static const colorCode = 'colorCode';
  static const whf = 'whf';
  static const fbf = 'fbf';
  static const fgf = 'fgf';
  static const fef = 'fef';
  static const yof = 'yof';
  static const fvf = 'fvf';
  static const iyf = 'iyf';
  static const mgf = 'mgf';
  static const irf = 'irf';
  static const rof = 'rof';
  static const erf = 'erf';
  static const myf = 'myf';
  static const lbf = 'lbf';
  static const lgf = 'lgf';
  static const eyf = 'eyf';
  static const ruf = 'ruf';
  static const base = 'base';
  static const bVolume = 'bVolume';
  static const fanDeck = 'fandeck';
  static const formulation = 'formulation';
  //this is for CosmeticInteriorEmulsion table ends......................................................

  //This is for Color Base Table CosmeticInteriorEmulsion here....................................................
  static const columnId = "id";
  static const baseId = "bId";
  static const cBase = "base";
  static const unitPrice1 = "unitPrice1";
  static const unitPrice2 = "unitPrice2";
  static const unitPrice3 = "unitPrice3";
  static const unitPrice4 = "unitPrice4";
  static const kgLtrFlag = "kgLtrFlag";
  //This is for Color Base Table ends here......................................................

  //This is for Color Colorant table Strats here...............................................
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

  //This is for Shade Color table Starts here..................................................
  static const shadeColorColumnId = "columnId";
  static const sCId = "id";
  static const sId = "sId";
  static const sColorCode = "colorCode";
  static const sColorName = "colorName";
  static const styledist = "styledist";
  static const weatherproofextemulsion = "weatherproofextemulsion";
  static const smartdist = "smartdist";
  static const cosmeticintemulsion = "cosmeticintemulsion";
  static const magnetextemulsion = "magnetextemulsion";
  static const sRValue = "rValue";
  static const sGValue = "gValue";
  static const sBValue = "bValue";
  //This is for Shade Color table ends here....................................................

  //This is for BookMarked table Starts here...................................................
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

  //This is for Saved customer detail table Starts here.........................................................
  static const savedColumnId = "id";
  static const savedCustomerName = "customerName";
  static const savedCustomerAddress = "address";
  static const savedCustomerContact = "contact";
  static const savedCustomerColorName = "colorName";
  //This is for Saved table ends here...............................................................................

  //This is for saved customer detail color table Strats here.................................................................
  static const savedColorColumnId = "id";
  static const savedColorForeignKey = "cDForeignKey";
  static const savedColorName = "colorName";
  static const savedColorCode = "colorCode";
  static const savedProductName = "productName";
  static const savedCanSize = "canSize";
  static const savedFandeckId = "fandeckId";
  static const savedRColor = "rColor";
  static const savedGColor = "gColor";
  static const savedBColor = "bColor";
  //This is for saved customer detail color table ends here.................................................................

  //This is for WeatherProofExteriorEmulsion table starts here....................................................................
  static const colId = 'id';
  static const weatherId = "weatherId";
  static const weatherColorName = 'colorName';
  static const weatherColorCode = 'colorCode';
  static const weatherWhf = 'whf';
  static const weatherFbf = 'fbf';
  static const weatherFgf = 'fgf';
  static const weatherFef = 'fef';
  static const weatherYof = 'yof';
  static const weatherFvf = 'fvf';
  static const weatherIyf = 'iyf';
  static const weatherMgf = 'mgf';
  static const weatherIrf = 'irf';
  static const weatherRof = 'rof';
  static const weatherErf = 'erf';
  static const weatherMyf = 'myf';
  static const weatherLbf = 'lbf';
  static const weatherLgf = 'lgf';
  static const weatherEyf = 'eyf';
  static const weatherRuf = 'ruf';
  static const weatherBase = 'base';
  static const weatherBVolume = 'bVolume';
  static const weatherFanDeck = 'fandeck';
  //This is for WeatherProofExteriorEmulsion table ends here....................................................................

  //This is for SmartDistemper table starts here...........................................................................
  static const colmId = 'id';
  static const smartId = "smartId";
  static const smartColorName = 'colorName';
  static const smartColorCode = 'colorCode';
  static const smartWhf = 'whf';
  static const smartFbf = 'fbf';
  static const smartFgf = 'fgf';
  static const smartFef = 'fef';
  static const smartYof = 'yof';
  static const smartFvf = 'fvf';
  static const smartIyf = 'iyf';
  static const smartMgf = 'mgf';
  static const smartIrf = 'irf';
  static const smartRof = 'rof';
  static const smartErf = 'erf';
  static const smartMyf = 'myf';
  static const smartLbf = 'lbf';
  static const smartLgf = 'lgf';
  static const smartEyf = 'eyf';
  static const smartRuf = 'ruf';
  static const smartBase = 'base';
  static const smartBVolume = 'bVolume';
  static const smartFanDeck = 'fandeck';
  //This is for SmartDistemper table ends here..............................................................................

  //This is for MagnetExteriorEmulsion table starts here....................................................................
  static const colmnId = 'id';
  static const magneticId = "magneticId";
  static const magnetColorName = 'colorName';
  static const magnetColorCode = 'colorCode';
  static const magnetWhf = 'whf';
  static const magnetFbf = 'fbf';
  static const magnetFgf = 'fgf';
  static const magnetFef = 'fef';
  static const magnetYof = 'yof';
  static const magnetFvf = 'fvf';
  static const magnetIyf = 'iyf';
  static const magnetMgf = 'mgf';
  static const magnetIrf = 'irf';
  static const magnetRof = 'rof';
  static const magnetErf = 'erf';
  static const magnetMyf = 'myf';
  static const magnetLbf = 'lbf';
  static const magnetLgf = 'lgf';
  static const magnetEyf = 'eyf';
  static const magnetRuf = 'ruf';
  static const magnetBase = 'base';
  static const magnetBVolume = 'bVolume';
  static const magnetFanDeck = 'fandeck';
  //This is for MagnetExteriorEmulsion table ends here......................................................................

  //This is for StyleDistemper table starts here.............................................................................
  static const styleColId = 'id';
  static const styleId = "styleId";
  static const styleColorName = 'colorName';
  static const styleColorCode = 'colorCode';
  static const styleWhf = 'whf';
  static const styleFbf = 'fbf';
  static const styleFgf = 'fgf';
  static const styleFef = 'fef';
  static const styleYof = 'yof';
  static const styleFvf = 'fvf';
  static const styleIyf = 'iyf';
  static const styleMgf = 'mgf';
  static const styleIrf = 'irf';
  static const styleRof = 'rof';
  static const styleErf = 'erf';
  static const styleMyf = 'myf';
  static const styleLbf = 'lbf';
  static const styleLgf = 'lgf';
  static const styleEyf = 'eyf';
  static const styleRuf = 'ruf';
  static const styleBase = 'base';
  static const styleBVolume = 'bVolume';
  static const styleFanDeck = 'fandeck';
  //This is for StyleDistemper table ends here..............................................................................

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
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
    dbpath1 = join(path, "FashionPaints.db");
    dbpath = await openDatabase(dbpath1!,
        version: _databaseVersion, onCreate: _onCreate);
    print("This is database path $dbpath");
    return dbpath;
  }

  Future<void> cleanDatabase() async {
    final db = await instance.database;
    if (table1.isNotEmpty) {
      db?.delete(table1);
    }

    if (table2.isNotEmpty) {
      db?.delete(table2);
    }

    if (table3.isNotEmpty) {
      db?.delete(table3);
    }

    if (table4.isNotEmpty) {
      db?.delete(table4);
    }

    if (table5.isNotEmpty) {
      db?.delete(table5);
    }

    if (table6.isNotEmpty) {
      db?.delete(table6);
    }

    if (table7.isNotEmpty) {
      db?.delete(table7);
    }

    if (table8.isNotEmpty) {
      db?.delete(table8);
    }

    if (table9.isNotEmpty) {
      db?.delete(table9);
    }

    if (table10.isNotEmpty) {
      db?.delete(table10);
    }

    if (table11.isNotEmpty) {
      db?.delete(table11);
    }
  }

  Future _onCreate(Database db, int version) async {
    //class Double defeence table........................................................
    await db.execute('''
  CREATE TABLE $table1(
    $id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    $cosmeticId INTEGER NOT NULL,
    $colorName TEXT,
    $colorCode TEXT,
    $whf TEXT,
    $fbf TEXT,
    $fgf TEXT,
    $fef TEXT,
    $yof TEXT,
    $fvf TEXT,
    $iyf TEXT,
    $mgf TEXT,
    $irf TEXT,
    $rof TEXT,
    $erf TEXT,
    $myf TEXT,
    $lbf TEXT,
    $lgf TEXT,
    $eyf TEXT,
    $ruf TEXT,
    $base REAL,
    $bVolume TEXT,
    $fanDeck REAL,
    $formulation TEXT
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
    $styledist REAL,
    $weatherproofextemulsion REAL,
    $smartdist REAL,
    $cosmeticintemulsion REAL,
    $magnetextemulsion REAL,
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
        $savedCustomerColorName TEXT
      )
    ''').then((value) => null);

    await db.execute('''
      CREATE TABLE $table7(
        $savedColorColumnId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        $savedColorForeignKey INTEGER NOT NULL,
        $savedColorName TEXT,
        $savedColorCode TEXT,
        $savedProductName TEXT,
        $savedCanSize REAL,
        $savedFandeckId REAL,
        $savedRColor REAL,
        $savedGColor REAL,
        $savedBColor REAL,
        FOREIGN KEY ($savedColorForeignKey) REFERENCES $table6 ($savedColumnId)
      )
    ''').then((value) => null);

    await db.execute('''
      CREATE TABLE $table8(
        $colId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        $weatherId INTEGER NOT NULL,
        $weatherColorName TEXT,
        $weatherColorCode TEXT,
        $weatherWhf TEXT,
        $weatherFbf TEXT,
        $weatherFgf TEXT,
        $weatherFef TEXT,
        $weatherYof TEXT,
        $weatherFvf TEXT,
        $weatherIyf TEXT,
        $weatherMgf TEXT,
        $weatherIrf TEXT,
        $weatherRof TEXT,
        $weatherErf TEXT,
        $weatherMyf TEXT,
        $weatherLbf TEXT,
        $weatherLgf TEXT,
        $weatherEyf TEXT,
        $weatherRuf TEXT,
        $weatherBase REAL,
        $weatherBVolume TEXT,
        $weatherFanDeck REAL
      )
    ''').then((value) => null);

    await db.execute('''
      CREATE TABLE $table9(
        $colmId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        $smartId INTEGER NOT NULL,
        $smartColorName TEXT,
        $smartColorCode TEXT,
        $smartWhf TEXT,
        $smartFbf TEXT,
        $smartFgf TEXT,
        $smartFef TEXT,
        $smartYof TEXT,
        $smartFvf TEXT,
        $smartIyf TEXT,
        $smartMgf TEXT,
        $smartIrf TEXT,
        $smartRof TEXT,
        $smartErf TEXT,
        $smartMyf TEXT,
        $smartLbf TEXT,
        $smartLgf TEXT,
        $smartEyf TEXT,
        $smartRuf TEXT,
        $smartBase REAL,
        $smartBVolume TEXT,
        $smartFanDeck REAL
      )
    ''').then((value) => null);

    db.execute('''
      CREATE TABLE $table10(
        $colmnId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        $magneticId INTEGER NOT NULL,
        $magnetColorName TEXT,
        $magnetColorCode TEXT,
        $magnetWhf TEXT,
        $magnetFbf TEXT,
        $magnetFgf TEXT,
        $magnetFef TEXT,
        $magnetYof TEXT,
        $magnetFvf TEXT,
        $magnetIyf TEXT,
        $magnetMgf TEXT,
        $magnetIrf TEXT,
        $magnetRof TEXT,
        $magnetErf TEXT,
        $magnetMyf TEXT,
        $magnetLbf TEXT,
        $magnetLgf TEXT,
        $magnetEyf TEXT,
        $magnetRuf TEXT,
        $magnetBase REAL,
        $magnetBVolume TEXT,
        $magnetFanDeck REAL
      )
    ''').then((value) => null);

    db.execute('''
      CREATE TABLE $table11(
        $styleColId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        $styleId INTEGER NOT NULL,
        $styleColorName TEXT,
        $styleColorCode TEXT,
        $styleWhf TEXT,
        $styleFbf TEXT,
        $styleFgf TEXT,
        $styleFef TEXT,
        $styleYof TEXT,
        $styleFvf TEXT,
        $styleIyf TEXT,
        $styleMgf TEXT,
        $styleIrf TEXT,
        $styleRof TEXT,
        $styleErf TEXT,
        $styleMyf TEXT,
        $styleLbf TEXT,
        $styleLgf TEXT,
        $styleEyf TEXT,
        $styleRuf TEXT,
        $styleBase REAL,
        $styleBVolume TEXT,
        $styleFanDeck REAL
      )
    ''').then((value) => null);
  }

  //double defence ko data add,query,all data get ya bata start ho hai................................................................
  Future<int?> addCosmeticIntData(CosmeticInt cosmeticint) async {
    Database? db = await instance.database;
    return await db?.insert(table1, cosmeticint.toMap());
  }

  Future<List<CosmeticInt>> getCosmeticIntData() async {
    Database? db = await instance.database;
    var data = await db?.query(table1);
    List<CosmeticInt>? cosmeticInteriorList = data!.isNotEmpty
        ? data.map((c) => CosmeticInt.fromMap(c)).toList()
        : [];
    return cosmeticInteriorList;
  }

  /* double defence database ma query laga ko baseId lina lai and color code ko value matra aaxa vhane color code le query garne haina vhane color
  Name le matra query garne*/
  Future<List<CosmeticInt>> queryCosmeticInt(
      String? productName, double? fanDeckId, String? colorCodeOrName) async {
    Database? db = await instance.database;
    var data = await db?.query(table1,
        where: '$fanDeck=? and $colorName=?',
        whereArgs: [fanDeckId, colorCodeOrName]);
    return data!.isNotEmpty
        ? data.map((c) => CosmeticInt.fromMap(c)).toList()
        : [];
  }
  //double defence ko data add,query,all data get ya bata end ho hai................................................................

  //color Base ko data add,all data get ya bata start ho hai........................................................................
  Future<int?> addColorBaseData(DatabaseColorBase colorBase) async {
    Database? db = await instance.database;
    var batch = db!.batch();
    return await db.insert(table2, colorBase.toMap());
  }

  Future<List<DatabaseColorBase>> getColorBaseData() async {
    Database? db = await instance.database;
    var data = await db?.query(table2);
    List<DatabaseColorBase>? colorBaseDataList = data!.isNotEmpty
        ? data.map((e) => DatabaseColorBase.fromMap(e)).toList()
        : [];
    return colorBaseDataList;
  }
  //color Base ko data add,all data get ya bata end ho hai........................................................................

  //color colorant ko data add,query,all data get ya bata start ho hai........................................................................
  Future<int?> addColorColorantData(Colorants colorColorants) async {
    Database? db = await instance.database;
    return await db?.insert(table3, colorColorants.toMap());
  }

  Future<List<Colorants>> queryColorantsColor(
      String? colorantCodeOrName) async {
    Database? db = await instance.database;
    var data = await db?.query(table3,
        where: '$colorantCode=?', whereArgs: [colorantCodeOrName]);
    return data!.isNotEmpty
        ? data.map((c) => Colorants.fromMap(c)).toList()
        : [];
  }

  Future<List<Colorants>> getColorColorantData() async {
    Database? db = await instance.database;
    var data = await db?.query(table3);
    List<Colorants>? colorColorantsDataList =
        data!.isNotEmpty ? data.map((e) => Colorants.fromMap(e)).toList() : [];
    return colorColorantsDataList;
  }
  //color colorant ko data add,query,all data get ya bata end ho hai........................................................................

  //shade color ko data add,query,all data get ya bata start ho hai........................................................................
  Future<int?> addShadeColorData(ShadeColorDatabase shadeColor) async {
    Database? db = await instance.database;
    return await db?.insert(table4, shadeColor.toMap());
  }

  Future<List<ShadeColorDatabase>> getShadeColorData() async {
    Database? db = await instance.database;
    var data = await db?.query(table4);
    List<ShadeColorDatabase>? shadeColorDataList = data!.isNotEmpty
        ? data.map((e) => ShadeColorDatabase.fromMap(e)).toList()
        : [];
    return shadeColorDataList;
  }

  //here
  Future<List<ShadeColorDatabase>> queryShadeColor(String? colorName) async {
    Database? db = await instance.database;
    var data =
        await db?.query(table4, where: '$sColorName=?', whereArgs: [colorName]);
    return data!.isNotEmpty
        ? data.map((e) => ShadeColorDatabase.fromMap(e)).toList()
        : [];
  }
  //shade color ko data add,query,all data get ya bata end ho hai........................................................................

  //Book Marked ko data add,get garne ya bata start ho..................................................................................
  Future<int?> addBookMarkedData(BookMarked bookMarked) async {
    Database? db = await instance.database;
    return await db?.insert(table5, bookMarked.toMap());
  }

  Future<List<BookMarked>> getBookMarkedData() async {
    Database? db = await instance.database;
    var data = await db?.query(table5);
    List<BookMarked>? bookMarkedDataList =
        data!.isNotEmpty ? data.map((e) => BookMarked.fromMap(e)).toList() : [];
    return bookMarkedDataList;
  }

  Future<int?> updateBookMarkedData(BookMarked bookMarked, id) async {
    Database? db = await instance.database;
    return await db?.update(table5, bookMarked.toMap(),
        where: "$bookMarkedColmId=?", whereArgs: [id]);
  }
  //Book Marked ko data add,get garne ya bata end ho.........................................................................................

  //Saved ko data add,get garne ya bata start ho hai.........................................................................................
  Future<int?> addSavedData(SavedCustomerDetail saved) async {
    Database? db = await instance.database;
    return await db?.insert(table6, saved.toMap());
  }

  Future<List<SavedCustomerDetail>> getSavedData() async {
    Database? db = await instance.database;
    var data = await db?.query(table6);
    List<SavedCustomerDetail> savedDataList = data!.isNotEmpty
        ? data.map((e) => SavedCustomerDetail.fromMap(e)).toList()
        : [];
    return savedDataList;
  }

  Future<int?> addSavedCustomerColorData(CustomerSavedColor saved) async {
    Database? db = await instance.database;
    return await db?.insert(table7, saved.toMap());
  }

  Future<List<CustomerSavedColor>> getSavedCustomerColorData() async {
    Database? db = await instance.database;
    var data = await db?.query(table7);
    List<CustomerSavedColor> savedDataList = data!.isNotEmpty
        ? data.map((e) => CustomerSavedColor.fromMap(e)).toList()
        : [];
    return savedDataList;
  }

  Future<List<CustomerSavedColor>> queryCustomerSavedColor(
      id, colorName) async {
    Database? db = await instance.database;
    var data = await db
        ?.query(table7, where: '$savedColorForeignKey=?', whereArgs: [id]);
    return data!.isNotEmpty
        ? data.map((e) => CustomerSavedColor.fromMap(e)).toList()
        : [];
  }
  //Saved ko data add,get garne ya bata end ho hai.........................................................................................

  //WeatherProofExteriorEmulsion ko data save,get and aaru task start here.....................................................................
  Future<int?> addWeatherExtData(WeatherProofExtemusion save) async {
    Database? db = await instance.database;
    return await db!.insert(table8, save.toMap());
  }

  Future<List<WeatherProofExtemusion?>?> getWeatherExtData() async {
    Database? db = await instance.database;
    var data = await db!.query(table8);
    List<WeatherProofExtemusion> dataList = data.isNotEmpty
        ? data.map((e) => WeatherProofExtemusion.fromMap(e)).toList()
        : [];
    return dataList;
  }
  //WeatherProofExteriorEmulsion ko data save,get and aaru task end here.....................................................................

  //SmartDistemper ko data add,save and aaru task start here....................................................................................
  Future<int?> addSmartDist(SmartDist saved) async {
    Database? db = await instance.database;
    return await db!.insert(table9, saved.toMap());
  }

  Future<List<SmartDist?>?> getSmartDist() async {
    Database? db = await instance.database;
    var data = await db!.query(table9);
    List<SmartDist> dataList =
        data.isNotEmpty ? data.map((e) => SmartDist.fromMap(e)).toList() : [];
    return dataList;
  }
  //SmartDistemper ko data add,save and aaru task end here....................................................................................

  //MagnetExteriorEmulsion ko data add,save and aaru task start here............................................................................
  Future<int?> addMagnetExt(MageneticExtEmulsion saved) async {
    Database? db = await instance.database;
    return await db!.insert(table10, saved.toMap());
  }

  Future<List<MageneticExtEmulsion?>?> getMagnetExt() async {
    Database? db = await instance.database;
    var data = await db!.query(table10);
    List<MageneticExtEmulsion> dataList = data.isNotEmpty
        ? data.map((e) => MageneticExtEmulsion.fromMap(e)).toList()
        : [];
    return dataList;
  }
  //MagnetExteriorEmulsion ko data add,save and aaru task end here............................................................................

  //StyleDistemper ko data add, save and aaru task start here...................................................................................
  Future<int?> addStyleDist(StyleDist saved) async {
    Database? db = await instance.database;
    return db?.insert(table11, saved.toMap());
  }

  Future<List<StyleDist?>?> getStyleDist() async {
    Database? db = await instance.database;
    var data = await db?.query(table11);
    List<StyleDist> dataList =
        data!.isNotEmpty ? data.map((e) => StyleDist.fromMap(e)).toList() : [];
  }
  //StyleDistemper ko data add, save and aaru task end here...................................................................................

  //all product query here...........................................................................................................
  Future<List<WeatherProofExtemusion?>?> queryWeatherProof(
      String? colorName) async {
    print("This is color Name $colorName");
    Database? db = await instance.database;
    var data = await db
        ?.query(table8, where: '$weatherColorName=?', whereArgs: [colorName]);
    return data!.isNotEmpty
        ? data.map((e) => WeatherProofExtemusion.fromMap(e)).toList()
        : [];
  }

  Future<List<StyleDist>?> queryStyleDistemper(colorName) async {
    Database? db = await instance.database;
    var data = await db
        ?.query(table11, where: '$styleColorName=?', whereArgs: [colorName]);
    return data!.isNotEmpty
        ? data.map((e) => StyleDist.fromMap(e)).toList()
        : [];
  }

  Future<List<SmartDist>?> querySmartDistemper(colorName) async {
    Database? db = await instance.database;
    var data = await db
        ?.query(table9, where: '$smartColorName=?', whereArgs: [colorName]);
    return data!.isNotEmpty
        ? data.map((e) => SmartDist.fromMap(e)).toList()
        : [];
  }

  Future<List<MageneticExtEmulsion>?> queryMagneticEmulsion(colorName) async {
    Database? db = await instance.database;
    var data = await db
        ?.query(table10, where: '$magnetColorName=?', whereArgs: [colorName]);
    return data!.isNotEmpty
        ? data.map((e) => MageneticExtEmulsion.fromMap(e)).toList()
        : [];
  }

  Future<List<ShadeColorDatabase>?> queryShade(rValue, gValue, bValue) async {
    print("This is rvalue of query $rValue");
    print("This is gvalue of query $gValue");
    print("This is bvalue of query $bValue");
    Database? db = await instance.database;
    var data = await db?.query("$table4",
        where: "$sRValue LIKE ? OR $sGValue LIKE ?",
        whereArgs: ['%$rValue%', '%$gValue%']);
    /*var data = await db?.rawQuery(
        "SELECT * FROM ShadeColor WHERE $sRValue='%$rValue%' AND $sGValue='%$gValue%' AND $sBValue='%$bValue%'");*/
    return data!.isNotEmpty
        ? data.map((e) => ShadeColorDatabase.fromMap(e)).toList()
        : [];

    /*   var data = await db?.query(table4,
        where: '$sRValue LIKE ? AND $sGValue LIKE ? AND $sBValue LIKE ?',
        whereArgs: [rValue, gValue, bValue]);
    return data!.isNotEmpty
        ? data.map((e) => ShadeColorDatabase.fromMap(e)).toList()
        : [];*/
  }

/*  Future<List<CosmeticInt>?> queryCosmeticInterior(colorName) async {
    Database? db = await instance.database;
    var data = await db?.query(table1, where: '$colorName=?', whereArgs: [colorName]);
    return data!.isNotEmpty
        ? data.map((e) => CosmeticInt.fromMap(e)).toList()
        : [];
  }*/
//all product query end here...........................................................................................................

}
