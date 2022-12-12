import 'package:sqlitepaxomov/entity/sklad_entity.dart';

class sklad extends sklad_entity {
  sklad({
    super.id,
    required super.Name,
    required super.Quantity,
    required super.Summ
  });

  Map<String, dynamic> toMap() {
    return {
      'Name': Name,
      'Quantity': Quantity,
      'Summ': Summ
    };
  }

  factory sklad.toFromMap(Map<String, dynamic> json) {
    return sklad(
        id: json['id'] as int,
        Name: json['Name'],
        Quantity: json['Quantity'],
        Summ: json['Summ']
    );
  }
}
