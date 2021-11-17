class DeliveryProfile {
  final String name;
  final String subscription;
  final int vouchers;
  final String email;
  List<Orders>? orders = [];
  List<FinishedOrders>? history = [];
  List<Favourite>? favourite = [];

  DeliveryProfile(this.name, this.subscription, this.vouchers, this.email);

  Map<String, dynamic> toJson() => {
        'name': name,
        'subscription': subscription,
        'vouchers': vouchers,
        'email': email,
        'orders': orders,
        'history': history,
        'favourite': favourite,
      };
}

class Orders {
  final int orderNumber;
  final List<String> meal;
  final DateTime orderDate;
  final String totalValue;
  final StatusOrder status;

  Orders(this.orderNumber, this.meal, this.orderDate, this.totalValue,
      this.status);
}

class FinishedOrders {
  final int orderNumber;
  final List<String> meal;
  final DateTime orderDate;
  final String totalValue;
  final StatusOrder status;

  FinishedOrders(this.orderNumber, this.meal, this.orderDate, this.totalValue,
      this.status);
}

class Favourite {
  final String name;
  final String description;
  final double price;

  Favourite(this.name, this.description, this.price);

  Map<String, dynamic> toJson() => {
    'name': name,
    'description': description,
    'price': price,
  };
}

enum Subscription { Iron, Bronse, Gold, Diamond }
enum StatusOrder { ongoing, completed }

extension CovertSubToString on Subscription {
  String toShortString() {
    return this.toString().split('.').last;
  }
}

extension ConvertOrdToString on StatusOrder {
  String toShortString() {
    return this.toString().split('.').last;
  }
}