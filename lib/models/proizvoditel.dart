import 'package:sqlitepaxomov/entity/proizvoditel_entity.dart';

class proizvoditel extends proizvoditel_entity {
  proizvoditel({
    super.id,
    required super.Name,
    required super.Address,
    required super.Number
  });

  Map<String, dynamic> toMap() {
    return {
      'Name': Name,
      'Address': Address,
      'Number': Number
    };
  }

  factory proizvoditel.toFromMap(Map<String, dynamic> json) {
    return proizvoditel(
      id: json['id'] as int,
      Name: json['Name'],
      Address: json['Address'],
      Number: json['Number']
    );
  }
}