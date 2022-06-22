import 'dart:convert';

class Usuario {
  dynamic userId;
  dynamic id;

  Usuario({
    required this.userId,
    required this.id,
  });

  Usuario copywith({
    // ignore: unnecessary_question_mark
    dynamic? userId,
    // ignore: unnecessary_question_mark
    dynamic? id,
  }) {
    return Usuario(userId: userId ?? this.userId, id: id ?? this.id);
  }

  Map<dynamic, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
    };
  }

  factory Usuario.fromMap(Map<dynamic, dynamic> map) => Usuario(
        userId: map["userId"],
        id: map["id"],
      );

  dynamic toJson() => json.encode(toMap());

  factory Usuario.fromJson(dynamic source) =>
      Usuario.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Usuario(id: $id, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Usuario && other.userId == userId && other.id == id;
  }

  @override
  int get hashCode => userId.hashCode ^ id.hashCode;
}
