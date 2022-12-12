import 'package:sqlitepaxomov/entity/store_entity.dart';

class store extends store_entity {
  store({
    super.id,
    required super.Name,
    required super.Address
  });

  Map<String, dynamic> toMap() {
    return {
      'Name': Name,
      'Address': Address
    };
  }

  factory store.toFromMap(Map<String, dynamic> json) {
    return store(
        id: json['id'] as int,
        Name: json['Name'],
        Address: json['Address']
    );
  }
}
