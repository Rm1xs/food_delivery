class DeliveryProfile {
  DeliveryProfile(this.name, this.subscription, this.vouchers, this.email);

  final String name;
  final String subscription;
  final int vouchers;
  final String email;
  List<Orders>? orders = [];
  List<FinishedOrders>? history = [];
  List<Favourite>? favourite = [];
  List<Delivery>? delivery = [];

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'subscription': subscription,
        'vouchers': vouchers,
        'email': email,
        'orders': orders,
        'history': history,
        'favourite': favourite,
        'delivery': delivery,
      };
}

class Orders {
  Orders(this.orderNumber, this.meal, this.orderDate, this.totalValue,
      this.status);

  final int orderNumber;
  final List<String> meal;
  final DateTime orderDate;
  final String totalValue;
  final StatusOrder status;
}

class FinishedOrders {
  FinishedOrders(this.orderNumber, this.meal, this.orderDate, this.totalValue,
      this.status);

  final int orderNumber;
  final List<String> meal;
  final DateTime orderDate;
  final String totalValue;
  final StatusOrder status;
}

class Favourite {
  Favourite(this.name, this.description, this.price);

  final String name;
  final String description;
  final double price;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'description': description,
        'price': price,
      };
}

class Delivery {
  Delivery(this.id, this.items, this.price, this.adress);

  final String id;
  final List<String> items;
  final String price;
  final String adress;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'items': items,
        'price': price,
        'adress': adress,
      };
}

enum Subscription {
  Iron_Profile,
  Bronze_Profile,
  Gold_Profile,
  Diamond_Profile
}
enum StatusOrder { ongoing, completed }

extension CovertSubToString on Subscription {
  String toShortString() {
    return toString().split('.').last;
  }
}

extension ConvertOrdToString on StatusOrder {
  String toShortString() {
    return toString().split('.').last;
  }
}
