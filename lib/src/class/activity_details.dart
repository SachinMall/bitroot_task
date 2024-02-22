// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ActivityDetails {
  final String product;
  final String store;
  final String time;
  final String add;
  final String price;
  ActivityDetails({
    required this.product,
    required this.store,
    required this.time,
    required this.add,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': product,
      'store': store,
      'time': time,
      'add': add,
      'price': price,
    };
  }

  factory ActivityDetails.fromMap(Map<String, dynamic> map) {
    return ActivityDetails(
      product: map['product'] as String,
      store: map['store'] as String,
      time: map['time'] as String,
      add: map['add'] as String,
      price: map['price'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ActivityDetails.fromJson(String source) =>
      ActivityDetails.fromMap(json.decode(source) as Map<String, dynamic>);

  ActivityDetails copyWith({
    String? product,
    String? store,
    String? time,
    String? add,
    String? price,
  }) {
    return ActivityDetails(
      product: product ?? this.product,
      store: store ?? this.store,
      time: time ?? this.time,
      add: add ?? this.add,
      price: price ?? this.price,
    );
  }
}
