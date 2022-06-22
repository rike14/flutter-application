import 'dart:convert';

class Pacientes {
  String username;
  int id;
  String email;
  String name;

  Pacientes(
      {required this.username,
      required this.id,
      required this.email,
      required this.name});

  Pacientes copywith({
    String? username,
    int? id,
    String? email,
    String? name,
  }) {
    return Pacientes(
        username: username ?? this.username,
        id: id ?? this.id,
        email: email ?? this.email,
        name: name ?? this.name);
  }

  Map<String, dynamic> toMap() {
    return {
      "username": username,
      "id": id,
      "email": email,
      "name": name,
    };
  }

  factory Pacientes.fromMap(Map<String, dynamic> map) {
    return Pacientes(
      username: map['username'],
      id: map['id'],
      email: map['email'],
      name: map['name'],
    );
  }
  String toJson() => json.encode(toMap());

  factory Pacientes.fromJson(String source) =>
      Pacientes.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Pacientes( username: $username , id: $id , email: $email , name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Pacientes &&
        other.username == username &&
        other.id == id &&
        other.email == email &&
        other.name == name;
  }

  @override
  int get hashCode {
    return id.hashCode ^ username.hashCode ^ email.hashCode ^ name.hashCode;
  }
}
