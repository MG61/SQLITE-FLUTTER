import 'package:sqlitepaxomov/entity/check_entity.dart';

class check extends check_entity{
  check({
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

  factory check.toFromMap(Map<String, dynamic> json) {
    return check(
        id: json['id'] as int,
        Name: json['Name'],
        Quantity: json['Quantity'],
        Summ: json['Summ']
    );
  }
}