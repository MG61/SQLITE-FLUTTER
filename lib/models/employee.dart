import 'package:sqlitepaxomov/entity/employee_entity.dart';

class employee extends employee_entity {
  employee({
    super.id,
    required super.Surname,
    required super.Number,
    required super.Email
  });

  Map<String, dynamic> toMap() {
    return {
      'Surname': Surname,
      'Number': Number,
      'Email': Email
    };
  }

  factory employee.toFromMap(Map<String, dynamic> json) {
    return employee(
        id: json['id'] as int,
        Surname: json['Surname'],
        Number: json['Number'],
        Email: json['Email']
    );
  }
}
