import 'package:yun_dao/entity.dart';

@Entity(nameInDb: "school", propertyList: [
  Property(name: "name", isPrimary: false, type: PropertyType.STRING),
  Property(name: "age", isPrimary: false, type: PropertyType.INT),
  Property(name: "id", isPrimary: true, type: PropertyType.INT)
])
class SchoolEntity {
  String name;
  int age;
  int id;
}
