// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// EntityGenerator
// **************************************************************************

///student表
import 'package:yun_dao/db_manager.dart';
import 'package:yun_dao/entity.dart';
import 'package:yun_dao_test/student_entity.dart';
import 'package:yun_dao/Dao.dart';
import 'package:yun_dao/query.dart';

class StudentEntityDao extends Dao<StudentEntity> {
  static List propertyMapList = [
    {
      "name": "name",
      "type": {"value": "TEXT"},
      "isPrimary": false
    },
    {
      "name": "age",
      "type": {"value": "INT"},
      "isPrimary": true
    }
  ];

  ///初始化数据库
  static Future<bool> init() async {
    DBManager dbManager = DBManager();
    List<Map> maps = await await dbManager.db
        .query("sqlite_master", where: " name = 'student'");
    if (maps == null || maps.length == 0) {
      List<Property> propertyList = List();
      for (Map map in propertyMapList) {
        propertyList.add(Property.fromJson(map));
      }
      dbManager.db
          .execute("CREATE TABLE student(name  TEXT,age  INTPRIMARY KEY)");
    }
    return true;
  }

  ///查询表中所有数据
  static Future<List<StudentEntity>> queryAll() async {
    DBManager dbManager = DBManager();
    List<StudentEntity> entityList = List();
    StudentEntityDao entityDao = StudentEntityDao();
    List<Map> maps = await dbManager.db.query("student");
    for (Map map in maps) {
      entityList.add(entityDao.formMap(map));
    }
    return entityList;
  }

  ///增加一条数据
  static Future<bool> insert(StudentEntity entity) async {
    DBManager dbManager = DBManager();
    StudentEntityDao entityDao = StudentEntityDao();
    await dbManager.db.insert("student", entityDao.toMap(entity));
    return true;
  }

  ///增加多条条数据
  static Future<bool> insertList(List<StudentEntity> entityList) async {
    DBManager dbManager = DBManager();
    List<Map> maps = List();
    StudentEntityDao entityDao = StudentEntityDao();
    for (StudentEntity entity in entityList) {
      maps.add(entityDao.toMap(entity));
    }
    await dbManager.db.rawInsert("student", maps);
    return true;
  }

  ///更新数据
  static Future<int> update(StudentEntity entity) async {
    DBManager dbManager = DBManager();
    StudentEntityDao entityDao = StudentEntityDao();
    return await dbManager.db.update("student", entityDao.toMap(entity),
        where: 'age = ?', whereArgs: [entity.age]);
  }

  ///删除数据
  static Future<int> delete(StudentEntity entity) async {
    DBManager dbManager = DBManager();
    return await dbManager.db
        .delete("student", where: 'age = ?', whereArgs: [entity.age]);
  }

  ///map转为entity
  @override
  StudentEntity formMap(Map map) {
    StudentEntity entity = StudentEntity();
    entity.name = map['name'];
    entity.age = map['age'];
    return entity;
  }

  ///entity转为map
  @override
  Map toMap(StudentEntity entity) {
    var map = Map<String, dynamic>();
    map['name'] = entity.name;
    map['age'] = entity.age;
    return map;
  }

  @override
  String getTableName() {
    return "student";
  }

  static QueryProperty NAME = QueryProperty(name: 'name');
  static QueryProperty AGE = QueryProperty(name: 'age');

  static Query queryBuild() {
    Query query = Query(StudentEntityDao());
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
