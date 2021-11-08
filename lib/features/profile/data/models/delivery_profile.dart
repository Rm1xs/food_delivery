class DeliveryProfile {
  final String name;
  final String subscription;
  final int vouchers;
  final String email;
  Orders? orders;

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

enum Subscription { start, middle, advanced, gold }
enum StatusOrder { ongoing, completed }
