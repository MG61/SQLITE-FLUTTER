import 'package:sqlitepaxomov/entity/deliver_entity.dart';

class deliver extends deliver_entity {
  deliver({
    super.id,
    required super.Surname_dost,
    required super.Address,
    required super.Name,
    required super.Summ
  });

  Map<String, dynamic> toMap() {
    return {
      'Surname_dost': Surname_dost,
      'Address': Address,
      'Name': Name,
      'Summ': Summ
    };
  }

  factory deliver.toFromMap(Map<String, dynamic> json) {
    return deliver(
        id: json['id'] as int,
        Surname_dost: json['Surname_dost'],
        Address: json['Address'],
        Name: json['Name'],
        Summ: json['Summ']
    );
  }
}
