import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserDetails {
  final String name;
  final String image;
  UserDetails({
    required this.name,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
    };
  }

  factory UserDetails.fromMap(Map<String, dynamic> map) {
    return UserDetails(
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDetails.fromJson(String source) =>
      UserDetails.fromMap(json.decode(source) as Map<String, dynamic>);

  UserDetails copyWith({
    String? name,
    String? image,
  }) {
    return UserDetails(
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }
}
