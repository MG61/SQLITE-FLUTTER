import 'package:sqlitepaxomov/entity/client_entity.dart';

class client extends client_entity {
  client({
    super.id,
    required super.Surname,
    required super.Number
  });

  Map<String, dynamic> toMap() {
    return {
      'Surname': Surname,
      'Number': Number
    };
  }

  factory client.toFromMap(Map<String, dynamic> json) {
    return client(
        id: json['id'] as int,
        Surname: json['Surname'],
        Number: json['Number']
    );
  }
}