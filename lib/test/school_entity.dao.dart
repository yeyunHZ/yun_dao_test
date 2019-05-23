// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// EntityGenerator
// **************************************************************************

///school表
import 'package:yun_dao/db_manager.dart';
import 'package:yun_dao/entity.dart';
import 'package:yun_dao_test/test/school_entity.dart';
import 'package:yun_dao/Dao.dart';
import 'package:yun_dao/query.dart';

class SchoolEntityDao extends Dao<SchoolEntity> {
  static List propertyMapList = [
    {
      "name": "name",
      "type": {"value": "TEXT"},
      "isPrimary": false
    },
    {
      "name": "age",
      "type": {"value": "INT"},
      "isPrimary": false
    },
    {
      "name": "id",
      "type": {"value": "INT"},
      "isPrimary": true
    }
  ];

  ///初始化数据库
  static Future<bool> init() async {
    DBManager dbManager = DBManager();
    List<Map> maps = await await dbManager.db
        .query("sqlite_master", where: " name = 'school'");
    if (maps == null || maps.length == 0) {
      List<Property> propertyList = List();
      for (Map map in propertyMapList) {
        propertyList.add(Property.fromJson(map));
      }
      dbManager.db.execute(
          "CREATE TABLE school(name  TEXT,age  INT,id  INTPRIMARY KEY)");
    }
    return true;
  }

  ///查询表中所有数据
  static Future<List<SchoolEntity>> queryAll() async {
    DBManager dbManager = DBManager();
    List<SchoolEntity> entityList = List();
    SchoolEntityDao entityDao = SchoolEntityDao();
    List<Map> maps = await dbManager.db.query("school");
    for (Map map in maps) {
      entityList.add(entityDao.formMap(map));
    }
    return entityList;
  }

  ///增加一条数据
  static Future<bool> insert(SchoolEntity entity) async {
    DBManager dbManager = DBManager();
    SchoolEntityDao entityDao = SchoolEntityDao();
    await dbManager.db.insert("school", entityDao.toMap(entity));
    return true;
  }

  ///增加多条条数据
  static Future<bool> insertList(List<SchoolEntity> entityList) async {
    DBManager dbManager = DBManager();
    List<Map> maps = List();
    SchoolEntityDao entityDao = SchoolEntityDao();
    for (SchoolEntity entity in entityList) {
      maps.add(entityDao.toMap(entity));
    }
    await dbManager.db.rawInsert("school", maps);
    return true;
  }

  ///更新数据
  static Future<int> update(SchoolEntity entity) async {
    DBManager dbManager = DBManager();
    SchoolEntityDao entityDao = SchoolEntityDao();
    return await dbManager.db.update("school", entityDao.toMap(entity),
        where: 'id = ?', whereArgs: [entity.id]);
  }

  ///删除数据
  static Future<int> delete(SchoolEntity entity) async {
    DBManager dbManager = DBManager();
    return await dbManager.db
        .delete("school", where: 'id = ?', whereArgs: [entity.id]);
  }

  ///map转为entity
  @override
  SchoolEntity formMap(Map map) {
    SchoolEntity entity = SchoolEntity();
    entity.name = map['name'];
    entity.age = map['age'];
    entity.id = map['id'];
    return entity;
  }

  ///entity转为map
  @override
  Map toMap(SchoolEntity entity) {
    var map = Map<String, dynamic>();
    map['name'] = entity.name;
    map['age'] = entity.age;
    map['id'] = entity.id;
    return map;
  }

  @override
  String getTableName() {
    return "school";
  }

  static QueryProperty NAME = QueryProperty(name: 'name');
  static QueryProperty AGE = QueryProperty(name: 'age');
  static QueryProperty ID = QueryProperty(name: 'id');

  static Query queryBuild() {
    Query query = Query(SchoolEntityDao());
    return query;
  }
}

///查询条件生成
class QueryProperty {
  String name;
  QueryProperty({this.name});
  QueryCondition equal(dynamic queryValue) {
    QueryCondition queryCondition = QueryCondition();
    queryCondition.key = name;
    queryCondition.value = queryValue;
    return queryCondition;
  }
}
