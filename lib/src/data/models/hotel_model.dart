import 'dart:convert';

class Hotel {
  final String hotelName;
  final String location;
  final int code;
  const Hotel(
    this.hotelName,
    this.location,
    this.code,
  );
  Map<String, dynamic> toJson() {
    return {
      'hotelName': hotelName,
      'location': location,
      'code': code,
    };
  }

  factory Hotel.fromMap(Map<String, dynamic> map) {
    return Hotel(
      map['hotelName'],
      map['location'],
      map['code'],
    );
  }
  factory Hotel.fromJson(String source) => Hotel.fromMap(json.decode(source));
}
