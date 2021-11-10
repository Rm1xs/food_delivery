class DeliveryProfile {
  final String name;
  final String subscription;
  final int vouchers;
  final String email;
  Orders? orders;
  FinishedOrders? history;
  Favourite? favourite;

  DeliveryProfile(
      this.name, this.subscription, this.vouchers, this.email);

  Map<String, dynamic> toJson() => {
        'name': name,
        'subscription': subscription,
        'vouchers': vouchers,
        'email': email,
        'orders': orders,
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
  final int id;
  final String name;
  final String description;
  final double price;

  Favourite(this.id, this.name, this.description, this.price);
}

enum Subscription { start, middle, advanced, gold }
enum StatusOrder { ongoing, completed }
