import 'dart:core';

class DeliveryModel {
  DeliveryModel(this.id, this.items, this.price, this.adress, this.name,
      this.phone, this.date);

  final String id;
  final List<String>? items;
  final String? price;
  final String? adress;
  final String? name;
  final String? phone;
  final String? date;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'items': items,
        'price': price,
        'adress': adress,
        'name': name,
        'phone': phone,
        'date': date,
      };
}
