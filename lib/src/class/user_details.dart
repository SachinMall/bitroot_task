import 'dart:convert';

class UserDetails {
  final String name;
  final String surname;
  final String image;

  UserDetails({
    required this.name,
    required this.surname,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'surname': surname,
      'image': image,
    };
  }

  factory UserDetails.fromMap(Map<String, dynamic> map) {
    return UserDetails(
      name: map['name'] as String,
      surname: map['surname'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDetails.fromJson(String source) =>
      UserDetails.fromMap(json.decode(source) as Map<String, dynamic>);

  UserDetails copyWith({
    String? name,
    String? surname,
    String? image,
  }) {
    return UserDetails(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      image: image ?? this.image,
    );
  }
}
