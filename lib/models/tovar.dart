import 'package:sqlitepaxomov/entity/tovar_entity.dart';

class tovar extends tovar_entity {
  tovar({
    super.id,
    required super.Name,
    required super.Price,
    required super.proizv
  });

  Map<String, dynamic> toMap() {
    return {
      'Name': Name,
      'Price': Price,
      'proizv': proizv
    };
  }

  factory tovar.toFromMap(Map<String, dynamic> json) {
    return tovar(
        id: json['id'] as int,
        Name: json['Name'],
        Price: json['Price'],
        proizv: json['proizv']
    );
  }
}
