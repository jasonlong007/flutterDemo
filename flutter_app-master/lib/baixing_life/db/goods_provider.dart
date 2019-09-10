import 'package:flutter_app/bean/baixing.dart';
import 'package:flutter_app/utils/database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:quiver/strings.dart' as strings;

class GoodsProvider extends BaseDBProvider {
  /// DataBase table name
  static final String table_name = "products";

  static final String COLUMN_ID = "_id";
  static final String COLUMN_IMAGE = "image";
  static final String COLUMN_NAME = "name";
  static final String COLUMN_PRICE = "price";
  static final String COLUMN_ORI_PRICE = "ori_price";
  static final String COLUMN_NUM = "number";
  static final String COLUMN_GOODS_ID = "goods_id";
  static final String COLUMN_SHOP_ID = "shop_id";
  static final String COLUMN_IS_CHECK = "is_checked";

  @override
  String createSql() =>
      baseCreateSql(table_name, COLUMN_ID) +
      '''
       $COLUMN_GOODS_ID TEXT not null,
       $COLUMN_NAME TEXT not null,
       $COLUMN_PRICE REAL not null,
       $COLUMN_ORI_PRICE REAL not null,
       $COLUMN_NUM INTEGER not null,
       $COLUMN_IS_CHECK INTEGER not null,
       $COLUMN_SHOP_ID TEXT not null,
        $COLUMN_IMAGE TEXT not null)
      ''';

  @override
  String tableName() => table_name;

  Future<List<Goods>> getGoodsList() async {
    List<Goods> products = List();
    Database db = await getDB();
    List<Map<String, dynamic>> maps = await db.query(table_name);
    if (maps.isNotEmpty) {
      for (Map<String, dynamic> map in maps) {
        Goods goods = Goods.fromJson(map);
        products.add(goods);
      }
    }
    return products;
  }

  Future<List<Goods>> getCheckedGoodsList() async {
    List<Goods> products = List();
    Database db = await getDB();
    List<Map<String, dynamic>> maps = await db
        .query(table_name, where: "$COLUMN_IS_CHECK = ?", whereArgs: [1]);
    if (maps.isNotEmpty) {
      for (Map<String, dynamic> map in maps) {
        Goods goods = Goods.fromJson(map);
        products.add(goods);
      }
    }
    return products;
  }

  Future<int> insertOrReplaceToDB(Goods goods) async {
    String goodsId = goods?.goodsId;
    if (goods == null || strings.isEmpty(goodsId) == null) return null;
    Database db = await getDB();
    bool is_exist = await isExist(goodsId);
    Map<String, dynamic> map = goods.toMap();
    if (is_exist) {
      return await db.update(table_name, map,
          where: "$COLUMN_GOODS_ID = ?", whereArgs: [goodsId]);
    }
    return await db.insert(table_name, map);
  }

  Future<bool> isExist(String goodsId) async {
    if (goodsId == null) return false;
    Database db = await getDB();
    List<Map<String, dynamic>> maps = await db
        .query(table_name, where: "$COLUMN_GOODS_ID = ?", whereArgs: [goodsId]);
    return maps.isNotEmpty;
  }

  Future<int> goodsAmount(String goodsId) async {
    if (goodsId == null) return 0;
    bool is_exist = await isExist(goodsId);
    if (is_exist) {
      Database db = await getDB();
      List<Map<String, dynamic>> maps = await db.query(table_name,
          where: "$COLUMN_GOODS_ID = ?", whereArgs: [goodsId]);

      return maps[0]['$COLUMN_NUM'];
    }

    return 0;
  }

  Future<void> deleteGoods(String goodsId) async {
    bool is_exist = await isExist(goodsId);
    Database db = await getDB();
    if (is_exist) {
      db.delete(table_name,
          where: "$COLUMN_GOODS_ID = ?", whereArgs: [goodsId]);
    }
  }
}
