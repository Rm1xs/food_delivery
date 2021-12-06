import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery/features/orders/domain/repositories/orders_repository.dart';

class OrdersRepositoryImplementation implements OrdersRepository {
  @override
  Future<void> addToOrder(String food) async {
    // TODO: implement getStatusOrder
    throw UnimplementedError();
  }

  @override
  Future<void> getStatusOrder() {
    // TODO: implement getStatusOrder
    throw UnimplementedError();
  }

  @override
  Future<void> removeFromOrder(String id) async {
    final User tokenResult = FirebaseAuth.instance.currentUser!;
    final String idToken = tokenResult.uid;
    var a = await FirebaseFirestore.instance.collection('Delivery Profiles').doc(idToken);
    a.collection('orders').where(id, isEqualTo : id).delete();
  }

  @override
  Future<void> saveOrder() {
    // TODO: implement saveOrder
    throw UnimplementedError();
  }

  @override
  Future<DocumentSnapshot> getItemsInOrder() async {
    final User tokenResult = FirebaseAuth.instance.currentUser!;
    final String idToken = tokenResult.uid;
    final DocumentSnapshot<Map<String, dynamic>> document = await FirebaseFirestore.instance
        .collection('Delivery Profiles')
        .doc(idToken)
        .get();
    return document;
  }

  @override
  Future<int> getOrderPrice() async {
    final User tokenResult = FirebaseAuth.instance.currentUser!;
    final String idToken = tokenResult.uid;
    int price = 0;
    final DocumentSnapshot<Map<String, dynamic>> document = await FirebaseFirestore.instance
        .collection('Delivery Profiles')
        .doc(idToken)
        .get();
    document.data()!['orders'].forEach((element) => {
          element.values.forEach((value) => {price += int.parse(value.keys.elementAt(0))}),
        });
    return price;
  }
}
