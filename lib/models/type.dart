import 'package:sqlitepaxomov/entity/type_entity.dart';

class type extends type_entity {
  type({
    super.id,
    required super.Name
  });

  Map<String, dynamic> toMap() {
    return {
      'Name': Name
    };
  }

  factory type.toFromMap(Map<String, dynamic> json) {
    return type(
        id: json['id'] as int,
        Name: json['Name']
    );
  }
}
