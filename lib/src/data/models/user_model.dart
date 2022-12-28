import 'dart:convert';

class User {
  final int coin;
  User({
    required this.coin,
  });
  Map<String, dynamic> toMap() {
    return {
      'coin': coin,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      coin: map['coin'],
    );
  }
  String toJson() => json.encode(toMap());
  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
